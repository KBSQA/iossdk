import Foundation
import OpenAPIRuntime
import OpenAPIURLSession
class BillersAPIClient {
    private let client: Client
    private let apiKey: String
    init(apiKey: String) {
        let serverURL = try! Servers.server1()
        self.client = Client(serverURL: serverURL, transport: URLSessionTransport())
        self.apiKey = apiKey
    }
    
    func getCurrencies(completion: @escaping (Result<[CurrencyItem], Error>) -> Void) async {
        do {
            let response = try await client.getCurrencies(headers: .init(x_hyphen_api_hyphen_key: self.apiKey))
            let data = try response.ok.body.json.Items
            
            let jsonData = try JSONEncoder().encode(data)

            let decodedData = try JSONDecoder().decode([CurrencyItem].self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    func getCountries(completion: @escaping (Result<[CountryItem], Error>) -> Void) async {
        do {
            let response = try await client.getCountries(headers: .init(x_hyphen_api_hyphen_key: self.apiKey))
            let data = try response.ok.body.json.Items
            
            let jsonData = try JSONEncoder().encode(data)

            let decodedData = try JSONDecoder().decode([CountryItem].self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    func getRegions(countryiso:String, completion: @escaping (Result<[RegionItem], Error>) -> Void) async {
        do {
            let response = try await client.getRegions(query: .init(countryIsos: countryiso), headers: .init(x_hyphen_api_hyphen_key: self.apiKey))
            let data = try response.ok.body.json.Items
            
            let jsonData = try JSONEncoder().encode(data)

            let decodedData = try JSONDecoder().decode([RegionItem].self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    func doAccountLookup(accountNumber:String, completion: @escaping (Result<[AccountLookupItem], Error>) -> Void) async {
        do {
            let response = try await client.getAccountLookUp(query: .init(accountNumber: accountNumber), headers: .init(x_hyphen_api_hyphen_key: self.apiKey))
            let data = try response.ok.body.json.Items
            
            let jsonData = try JSONEncoder().encode(data)

            let decodedData = try JSONDecoder().decode([AccountLookupItem].self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    func getProviders(countryIsos:String = "", providerCodes:String = "", regionCodes:String = "", accountNumber:String = "", completion: @escaping (Result<[ProviderItem], Error>) -> Void) async {
        do {
            let response = try await client.getProviders(query: .init(providerCodes: providerCodes, countryIsos: countryIsos,regionCodes: regionCodes,accountNumber: accountNumber), headers: .init(x_hyphen_api_hyphen_key: self.apiKey))
            let data = try response.ok.body.json.Items
            
            let jsonData = try JSONEncoder().encode(data)

            let decodedData = try JSONDecoder().decode([ProviderItem].self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    func getProducts(accountNumber:String = "", countryIsos:String = "", providerCodes:String = "", regionCodes:String = "", completion: @escaping (Result<[ProductItem], Error>) -> Void) async {
        do {
            let response = try await client.getProducts(query: .init(countryIsos: countryIsos, regionCodes: regionCodes, accountNumber: accountNumber), headers: .init(x_hyphen_api_hyphen_key: self.apiKey))
            let data = try response.ok.body.json.Items
            
            let jsonData = try JSONEncoder().encode(data)

            let decodedData = try JSONDecoder().decode([ProductItem].self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    func getProductDescription(skuCodes:String = "", completion: @escaping (Result<[ProductDescriptionItem], Error>) -> Void) async {
        do {
            let response = try await client.getProducts(query: .init(skuCodes: skuCodes), headers: .init(x_hyphen_api_hyphen_key: self.apiKey))
            let data = try response.ok.body.json.Items
            
            let jsonData = try JSONEncoder().encode(data)

            let decodedData = try JSONDecoder().decode([ProductDescriptionItem].self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    func sendTopupTransfer(accountNumber:String, distributionRef:String, sendCurrencyIso:String, sendValue:String, skuCode:String, validateOnly:Bool, completion: @escaping (Result<[ProductDescriptionItem], Error>) -> Void) async {
        do {
            let response = try await client.topUpTransfer(headers: .init(x_hyphen_api_hyphen_key: self.apiKey), body: .json(.init(AccountNumber: accountNumber, DistributorRef: distributionRef, SendCurrencyIso: sendCurrencyIso, SendValue: sendValue, SkuCode: skuCode, ValidateOnly:validateOnly)))
            let data = try response.ok.body
            print(data)

            //completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }    
    
    //GC
    
    func getBrands(category_id:String, page:String, completion: @escaping (Result<BrandsList, Error>) -> Void) async {
        do {
            let response = try await client.getBrands(query: .init(category_id:category_id, page:page), headers: .init(x_hyphen_api_hyphen_key: self.apiKey))
            let data = try response.ok.body.json
  //          print(data)
            let jsonData = try JSONEncoder().encode(data)
            let decodedData = try JSONDecoder().decode(BrandsList.self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    func getCategories(completion: @escaping (Result<GiftCategories, Error>) -> Void) async {
        do {
            let response = try await client.getCategories(headers: .init(x_hyphen_api_hyphen_key: self.apiKey))
            let data = try response.ok.body.json
            let jsonData = try JSONEncoder().encode(data)

            let decodedData = try JSONDecoder().decode(GiftCategories.self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    func giftCardOrder(reference_id:String, brand_code:String, currency:String, amount:Int, country:String, receiver_name:String, receiver_email:String, receiver_phone:String, completion: @escaping (Result<[ProductDescriptionItem], Error>) -> Void) async {
        do {
            let response = try await client.orderGiftCard(headers: .init(x_hyphen_api_hyphen_key: self.apiKey), body: .json(.init(reference_id: reference_id, notify: 0, brand_code: brand_code, currency: currency, amount: amount, country: country, receiver_name: receiver_name, receiver_email: receiver_email, receiver_phone:receiver_phone, message: "thanks", delivery_language: "en")))
            let data = try response.ok.body
            print(data)

            //completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    // Add more methods for other API endpoints...
}
