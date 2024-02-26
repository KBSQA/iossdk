import Foundation

struct ProviderItem: Codable {
    var ProviderCode: String
    var CountryIso: String
    var Name: String
    var ValidationRegex: String
    var RegionCodes: Array<String>
    var PaymentTypes: Array<String>
}
