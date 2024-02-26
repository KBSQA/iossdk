import Foundation

struct Country: Codable{
    var name: String
    var code: String
}

struct Denominations: Codable{
    //var amount: Int
    var is_active: Bool
}

struct DenominationsList: Codable {
    var QAR: Array<Denominations>
}


struct Brand: Codable{
    var id: Int
    var is_active: Bool
    var is_generic: Bool
    var brand_code: String
    var pin_redeemable: Bool
    var name: String
    var country: Country
    var validity_in_months: Int
    var variable_amount: Bool
    //var denominations: Denominations
    var tagline: String
    var description: String
    var brand_accepted_currency: String
    var redemption_type: String
    var redemption_instructions: String
}

struct BrandsList: Codable {
    var total_count: Int
    var total_page: Int
    var current_page: Int
    var current_page_count: Int
    var brands: Array<Brand>
}
