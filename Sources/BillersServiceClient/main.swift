import OpenAPIRuntime
import Foundation


//SAMPLE CODE FOR GET CURRENCIES

//THIS WILL BE YOUR API KEY
let apiKey = "4bfd190ec7c06c597a09323f81f26d8567af4d25e7e9b18729d424fa61307242"
let client = BillersAPIClient(apiKey:apiKey)


//GET CURRENCIES
do {
    try await client.getCurrencies() { result in
        switch result {
        case .success(let currencies):
            // Handle successful response
            print("First Currency: \(currencies[0])")
        case .failure(let error):
            // Handle error
            print("Error: \(error)")
        }
    }
} catch {
    // Handle error
    print("Error: \(error)")
}


//GET COUNTRIES

do {
    try await client.getCountries() { result in
        switch result {
        case .success(let country):
            // Handle successful response
            print("First Country: \(country[0])")
        case .failure(let error):
            // Handle error
            print("Error: \(error)")
        }
    }
} catch {
    // Handle error
    print("Error: \(error)")
}

//GET REGIONS

do {
    try await client.getRegions(countryiso:"AD") { result in
        switch result {
        case .success(let regions):
            // Handle successful response
            print("First Region: \(regions[0])")
        case .failure(let error):
            // Handle error
            print("Error: \(error)")
        }
    }
} catch {
    // Handle error
    print("Error: \(error)")
}

//DO ACCOUNT LOOKUP

do {
    try await client.doAccountLookup(accountNumber:"447479654326") { result in
        switch result {
        case .success(let account):
            // Handle successful response
            print("First Account: \(account[0])")
        case .failure(let error):
            // Handle error
            print("Error: \(error)")
        }
    }
} catch {
    // Handle error
    print("Error: \(error)")
}

//GET PROVIDERS

do {
    try await client.getProviders(countryIsos:"US") { result in
        switch result {
        case .success(let provider):
            // Handle successful response
            print("First Provider: \(provider[0])")
        case .failure(let error):
            // Handle error
            print("Error: \(error)")
        }
    }
} catch {
    // Handle error
    print("Error: \(error)")
}


//GET PRODUCTS

do {
    try await client.getProducts(accountNumber:"447479510421") { result in
        switch result {
        case .success(let product):
            // Handle successful response
            print("First Products: \(product[0])")
        case .failure(let error):
            // Handle error
            print("Error: \(error)")
        }
    }
} catch {
    // Handle error
    print("Error: \(error)")
}

//GET PRODUCT DESCRIPTION

do {
    try await client.getProductDescription(skuCodes:"HTGBGBP51824") { result in
        switch result {
        case .success(let desc):
            // Handle successful response
            print("First Description: \(desc)")
        case .failure(let error):
            // Handle error
            print("Error: \(error)")
        }
    }
} catch {
    // Handle error
    print("Error: \(error)")
}


//SEND TOPUP TRANSFER

do {
    try await client.sendTopupTransfer(accountNumber:"440000000000", distributionRef:"generatedref", sendCurrencyIso:"GBP", sendValue:"10.00", skuCode:"HTGBGB51824", validateOnly:false) { result in
        switch result {
        case .success(let desc):
            // Handle successful response
            print("Top up resp: \(desc)")
        case .failure(let error):
            // Handle error
            print("Error: \(error)")
        }
    }
} catch {
    // Handle error
    print("Error: \(error)")
}

/////GIFT////////
//GET BRANDS

do {
    try await client.getBrands(category_id:"21", page: "1") { result in
        switch result {
        case .success(let desc):
            // Handle successful response
            print("First Brand: \(desc.brands[0])")
        case .failure(let error):
            // Handle error
            print("Error: \(error)")
        }
    }
} catch {
    // Handle error
    print("Error: \(error)")
}


//GET CATEGORIES

do {
    try await client.getCategories() { result in
        switch result {
        case .success(let category):
            // Handle successful response
            print("First Category: \(category.categories[0])")
        case .failure(let error):
            // Handle error
            print("Error: \(error)")
        }
    }
} catch {
    // Handle error
    print("Error: \(error)")
}

//ORDER GIFT CARD

do {
    try await client.giftCardOrder(reference_id: "12344", brand_code: "1233", currency: "AED", amount: 100, country: "UAE", receiver_name: "John", receiver_email: "john@gmail.com", receiver_phone:"1233333") { result in
        switch result {
        case .success(let order):
            // Handle successful response
            print("Order Resp: \(order)")
        case .failure(let error):
            // Handle error
            print("Error: \(error)")
        }
    }
} catch {
    // Handle error
    print("Error: \(error)")
}

