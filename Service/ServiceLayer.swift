//
//  ServiceLayer.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import UIKit
import Alamofire

class ServiceLayer {
  
  static let shared = ServiceLayer()
  
  var creds: Credentials?
  
  public struct Credentials: Codable {
    
    let accessToken: String
    let refreshToken: String
    
    let expiresIn: String
    
  }
  
  public struct SignCredentials: Codable {
    
    let email: String
    let password: String
    
  }
  
  public struct CityAutocomplete: Codable {
    
    let term: String
    
  }
  
  public struct City: Codable {
    
    let city_name: String
    let city_code: String
    let country_name: String
    let country_code: String
    
  }
  
  public struct Trip: Codable {
    
    let tripClass: String
    let picture: String
    let destination: String
    let averagePrice: String
    
    public struct Flight: Codable {
      
      let value: Int
      let trip_duration: Int
      let signature: String
      let search_id: String
      let return_date: String
      let origin_name: String
      let origin: String
      let order_url_id: String
      let number_of_changes: Int
      let gate: String
      let found_at: String
      
      let duration: Int
      let direct: Bool
      let destination_name: String
      let destination: String
      let depart_date: String
      let airline: String
      
    }
    
    let flight: Flight
    
    public struct Hotel: Codable {
      
      let hotelId: String
      let hotelName: String
      let priceAvg: Double
      
      public struct Location: Codable {
        
        let name: String
        let country: String
        
        public struct Geo: Codable {
          
          let lat: Double
          let lon: Double
          
        }
        
        let geo: Geo
        
        let stars: Int
        
        let priceFrom: Double
        
        let locationId: String
        
      }
      
    }
    
    let hotels: [Hotel]
    
    public struct Entertainments: Codable {
      
      let id: Int
      let title: String
      let tagline: String
      let url: String
      let type: String
      let is_new: Bool
      let instant_booking: Bool
      let child_friendly: Bool
      let max_persons: Bool
      let duration: Double
      
      public struct Price: Codable {
        
        let value: Double
        let currency: String
        let value_string: String
        
      }
      
      let price: Price
      
      let rating: Double
      
      public struct Photos: Codable {
        
        let thumbnail: String
        let medium: String
        
      }
      
      let photos: Photos
      
      let status: String
      
    }
    
    let entertainments: Entertainments
    
  }
  
  public struct Trips: Codable {
    
    let cheapTrip: Trip
    let standardTrip: Trip
    let luxuryTrip: Trip
    
  }
  
  class func signIn(creds: SignCredentials, _ completion: @escaping ((Bool, Error?) -> Void)) {
    
    let url = "http://5.53.124.193:8080/sign-in"
    
    AF.request(url, method: .post, parameters: creds, encoder: JSONParameterEncoder.default)
      .validate()
      .responseDecodable(of: Credentials.self) { response in
        
        if case let .success(credentials) = response.result {
          
          ServiceLayer.shared.creds = credentials
          
          completion(true, nil)
          
        } else if case let .failure(err) = response.result {
          
          completion(false, err)
        
        }
        
    }
    
  }
  
  class func signUp(creds: SignCredentials, _ completion: @escaping ((Bool, Error?) -> Void)) {
    
    let url = "http://5.53.124.193:8080/sign-up"
    
    AF.request(url, method: .post, parameters: creds, encoder: JSONParameterEncoder.default)
      .validate()
      .responseDecodable(of: Credentials.self) { response in
        
        if case let .success(credentials) = response.result {
          
          ServiceLayer.shared.creds = credentials
          
          completion(true, nil)
          
        } else if case let .failure(err) = response.result {
          
          completion(false, err)
        
        }
        
    }
    
  }
  
  class func cityAutocomplete(term: CityAutocomplete, _ completion: @escaping ((Bool, Error?) -> Void)) {
    
    let url = "http://5.53.124.193:8080/city-autocomplete"
    
    let headers: HTTPHeaders = [
        "Bearer": shared.creds?.accessToken ?? "",
        "Accept": "application/json"
    ]
    
    dump(shared.creds?.accessToken)
    
    AF.request(url, method: .post, parameters: term, encoder: JSONParameterEncoder.default, headers: headers)
      .validate()
      .responseDecodable(of: City.self) { response in
        
        if case let .success(city) = response.result {
          
          getTrips(city: city) { (success, error) in
            
            completion(success, error)
            
          }
          
        } else if case let .failure(err) = response.result {
          
          completion(false, err)
        
        }
        
    }
    
  }
  
  class func getTrips(city: City, _ completion: @escaping ((Bool, Trips?, Error?) -> Void)) {
    
    let params = [
      "source": "LED",
      "destination": city.city_code
    ]
    
    let url = "http://5.53.124.193:8080/get-trips-by-city"
    
    let headers: HTTPHeaders = [
        "Bearer": shared.creds?.accessToken ?? "",
        "Accept": "application/json"
    ]
    
    AF.request(url, method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: headers)
      .validate()
      .responseDecodable(of: Trips.self) { response in
        
        if case let .success(trips) = response.result {
          
          completion(true, trips, nil)
          
        } else if case let .failure(err) = response.result {
          
          completion(false, nil, err)
        
        }
        
    }
    
  }
  
  public struct Redirect: Codable {
    
    let url: String
    
  }
  
  class func redirectToShop(flight: Trip.Flight, _ completion: @escaping ((Bool, Error?) -> Void)) {
    
    let params = [
      "flight": flight
    ]
    
    let url = "http://5.53.124.193:8080/redirect-to-shop"
    
    let headers: HTTPHeaders = [
        "Bearer": shared.creds?.accessToken ?? "",
        "Accept": "application/json"
    ]
    
    AF.request(url, method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: headers)
      .validate()
      .responseDecodable(of: Redirect.self) { response in
        
        if case let .success(redirect) = response.result {
          
          if let url = URL(string: redirect.url) {
              UIApplication.shared.open(url)
          }
          
          completion(true, nil)
          
        } else if case let .failure(err) = response.result {
          
          completion(false, err)
        
        }
        
    }
    
  }
  
}
