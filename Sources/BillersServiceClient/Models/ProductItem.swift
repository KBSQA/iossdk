import Foundation

struct MaxMinProduct: Codable{
    var CustomerFee: Int
    var DistributorFee: Int
    var ReceiveValue: Int
    var ReceiveCurrencyIso: String
    var ReceiveValueExcludingTax: Int
    var TaxRate: Int
    var SendValue: Int
    var SendCurrencyIso: String
}

struct ProductItem: Codable {
    var ProviderCode: String
    var SkuCode: String
    var LocalizationKey: String
    var Maximum: MaxMinProduct
    var Minimum: MaxMinProduct
    var ProcessingMode: String
    var RedemptionMechanism: String
    var Benefits: Array<String>
    var DefaultDisplayText: String
    var RegionCode: String
    var PaymentTypes: Array<String>
}

