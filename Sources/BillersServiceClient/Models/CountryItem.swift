import Foundation

struct InternationalDialingInformation: Codable{
    var Prefix: String
    var MinimumLength: Int
    var MaximumLength: Int
}


struct CountryItem: Codable {
    var CountryIso: String
    var CountryName: String
    var RegionCodes: Array<String>
}
