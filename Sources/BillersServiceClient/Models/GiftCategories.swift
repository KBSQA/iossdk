import Foundation

struct GiftCategory: Codable{
    var name: String
}

struct GiftCategories: Codable{
    var total_count: Int
    var total_page: Int
    var current_page: Int
    var current_page_count: Int
    var categories: [GiftCategory]
}
