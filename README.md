# API Handlers

This repository contains handlers for interacting with different APIs.

Add the Dependency In your Swift project, you can add the dependency using Swift Package Manager or Cocoapods.

Swift Package Manager Open your Xcode project. Go to "File" > "Swift Packages" > "Add Package Dependency..." Enter the repository URL: https://github.com/KBSQA/iossdk.git 
Select the version you want to use (e.g., 1.0.1). Click "Next" and then "Finish" to add the package to your project. 

## Initialize Handler

```swift
//THIS WILL BE YOUR API KEY
let apiKey = "4bfd190ecXXXXXXXXXXXXXXXXXXXX"
let client = BillersAPIClient(apiKey:apiKey)
```

## 1. getCurrencies

Sends a request to retrieve currency information.

#### Parameters

- `completion`: The callback to handle the API response. Implement this callback to define behavior on successful or failed API requests. You will have 2 result types .success, .failure

#### Example Usage

```swift
// Example: Retrieving currency information
try await client.getCurrencies() { result in
    switch result {
    case .success(let currencies):
        // Handle successful response
        //THIS WILL BE A LIST OF ALL CURRENCIES
        print("First Currency: \(currencies[0])")
    case .failure(let error):
        // Handle error
        print("Error: \(error)")
    }
}

```

## 2. getCountries

Sends a request to retrieve list of countries.

#### Parameters

- `completion`: The callback to handle the API response. Implement this callback to define behavior on successful or failed API requests. You will have 2 result types .success, .failure

#### Example Usage

```swift
// Example: Retrieving currency information
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

```

## 3. getRegions

Sends a request to retrieve list of regions in a country.

#### Parameters
- `countryiso`: This will be the 2 letter country ISO eg US
- `completion`: The callback to handle the API response. Implement this callback to define behavior on successful or failed API requests. You will have 2 result types .success, .failure

#### Example Usage

```swift
// Example: Retrieving currency information
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

```

## 4. doAccountLookup

Sends a request to retrieve information about a mobile number

#### Parameters
- `accountNumber`: This will be the mobile number including the dialing code
- `completion`: The callback to handle the API response. Implement this callback to define behavior on successful or failed API requests. You will have 2 result types .success, .failure

#### Example Usage

```swift
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
```

## 5. getProviders

Sends a request to retrieve all the mobile providers available in a given country

#### Parameters
- `countryIsos`: This will be the 2 letter country ISO
- `completion`: The callback to handle the API response. Implement this callback to define behavior on successful or failed API requests. You will have 2 result types .success, .failure

#### Example Usage

```swift
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
```

## 6. getProoducts

Sends a request to retrieve all the products available for a mobile number

#### Parameters
- `accountNumber`: This will be the mobile number including dialing code
- `completion`: The callback to handle the API response. Implement this callback to define behavior on successful or failed API requests. You will have 2 result types .success, .failure

#### Example Usage

```swift
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
```

## 7. getProoductDescription

Sends a request to retrieve the description of a product

#### Parameters
- `skuCodes`: This will be the product SKU code found in the product response
- `completion`: The callback to handle the API response. Implement this callback to define behavior on successful or failed API requests. You will have 2 result types .success, .failure

#### Example Usage

```swift
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
```

## 8. sendTopupTransfer

Sends a request to perform a topup on a mobile number

#### Parameters
- `accountNumber`: This will be the mobile number being topped up
- `distributionRef`: This will be a custom generated reference code
- `sendCurrencyIso`: This will be the currency ISO you will find this in the product response
- `sendValue`: This will be the value of topup you will find this in the product response
- `skuCode`: This will be the product SKU code found in the product response
- `validateOnly`: This paramter can be set to true so you are not charged, you can use this to check if a top up would be successful
- `completion`: The callback to handle the API response. Implement this callback to define behavior on successful or failed API requests. You will have 2 result types .success, .failure

#### Example Usage

```swift
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
```


### GIFT CARDS

## 1. getBrands

Sends a request to get available brands

#### Parameters
- `category_id`: This will be the category id for the chosen category this can be found in category response
- `page`: This will be the page number
- `completion`: The callback to handle the API response. Implement this callback to define behavior on successful or failed API requests. You will have 2 result types .success, .failure

#### Example Usage

```swift
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
```

## 2. getCategories

Sends a request to get available categories

#### Parameters
- `completion`: The callback to handle the API response. Implement this callback to define behavior on successful or failed API requests. You will have 2 result types .success, .failure

#### Example Usage

```swift
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
```

## 3. giftCardOrder

Sends a request to make a gift card order

#### Parameters
- `reference_id`: This is the gift card reference code its found in the brands response
- `brand_code`: This is the brand reference code its found in the brands response
- `currency`: This is the currency in which the gift card will be its also found in the brand response
- `amount`: This is the amount you will create a card for
- `country`: This is the country for the gift card also found in the brands response 
- `receiver_name`: This is the name of person who will receive the gift card
- `receiver_email`: This is the email of person who will receive the gift card
- `receiver_phone`: This is the numberof person who will receive the gift card
- `completion`: The callback to handle the API response. Implement this callback to define behavior on successful or failed API requests. You will have 2 result types .success, .failure

#### Example Usage

```swift
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
```

