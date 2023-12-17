//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Pedro Caetano on 17/12/23.
//

import Foundation

enum RequestError: Error{
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService{
    func fetchData() async throws -> Result<[StoreType], RequestError>{
        guard let url = URL(string: "https://private-36f463-pedrocaetano.apiary-mock.com/home") else{
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObjects)
    }
}
