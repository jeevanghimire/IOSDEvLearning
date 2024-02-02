//
//  ContentView.swift
//  NetworkPlayground
//
//  Created by Jeevan Ghimire on 31/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State  var user: GithubAPIs
    var body: some View {
        
        VStack(spacing:20) {
            AsyncImage(url: URL(string: user?.avatarUrl??,"")){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            }placeholder: {
                Circle()
                    .foregroundColor(.brown)
                   
            }
            .frame(width:280,height:120)
            Text(user.login,"No placeHolders")
                .font(.title3)
                .bold()
            Text(user.bio,"No Placeholder")
                .padding()
            Spacer()
        }
        .padding()
        .task{
            do{
                user = try await getUser()
                
            }catch GHErrors.invalidURL{
                 print("Invalid URL")
            }catch GHErrors.invalidResponse{
                print("Invalid Response")
           }catch GHErrors.invalidData{
               print("Invalid DATA")
           }catch{
               print("Unexpected Error, We are working on it please wait:<(")
           }
        }
    }
    func getUser() async throws ->GithubAPIs{
        let endpoint = "https://api.github.com/users/jeevanghimire"
        guard let url = URL(string: endpoint) else {throw GHErrors.invalidURL}
        let (data,resoponse) = try await URLSession.shared.data(from: url)
        guard let response = resoponse as? HTTPURLResponse, 
                response.statusCode == 200
                else
        {
            throw GHErrors.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GithubAPIs.self, from: data)
        }catch{
            throw GHErrors.invalidData
        }
    }
}

#Preview {
    ContentView(user: <#GithubAPIs#>)
}

struct GithubAPIs: Codable{
    let login: String
    let avatarUrl: String
    let bio: String
    
}

enum GHErrors: Error{
   case  invalidURL
    case invalidResponse
    case invalidData
    
}
