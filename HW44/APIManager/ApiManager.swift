//
//  ApiManager.swift
//  HW44
//
//  Created by Jarae on 7/4/23.
//

import Foundation
class APIManager {
    
    static let shared = APIManager()
    
    func getData(completion: @escaping (Result<DataModel, Error>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else {return}
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            
            guard let data = data else {return}
            
            do {
                let model = try JSONDecoder().decode(DataModel.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func postRequset(id: Int, title: String, completion: @escaping (Result<Int, Error>) -> Void) {
                        guard let url = URL(string: "https://dummyjson.com/products/add") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let products = DataModel(products: [.init(id: id, title: title)], total: 1, skip: 1, limit: 1)
        request.httpBody = try? JSONEncoder().encode(products)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {return}
            
            //guard let error =
            if let error = error {
                completion(.failure(error))
            }else {
                completion(.success((response.statusCode)))
            }
        }
        task.resume()
        
    }
    
    func putMethod() {
            guard let url = URL(string: "https://reqres.in/api/users/2") else { return }
        
            // Create the request
//            var request = URLRequest(url: url)
//            request.httpMethod = "PUT"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.httpBody = jsonData
//            URLSession.shared.dataTask(with: request) { data, response, error in
//                guard let data = data else { return }
//
//
//                do {
//                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
//                        print("Error: Cannot convert data to JSON object")
//                        return
//                    }
//                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
//                        print("Error: Cannot convert JSON object to Pretty JSON data")
//                        return
//                    }
//                    guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
//                        print("Error: Could print JSON in String")
//                        return
//                    }
//
//                    print(prettyPrintedJson)
//                } catch {
//                    print("Error: Trying to convert JSON data to string")
//                    return
//                }
//            }.resume()
        }
}
