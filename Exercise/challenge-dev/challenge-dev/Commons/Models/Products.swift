import Foundation
    
struct Product: Decodable {
    let name: String
    let description: String
    let price: Double
    let discount: Bool
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case name = "produto"
        case description = "descricao"
        case price = "preco"
        case discount = "desconto"
        case image = "imagem"
    }
}


//{
//    "produto": "Skol",
//    "descricao": "12 x 300 ml",
//    "preco": 19.96,
//    "desconto": true,
//    "imagem": "https://bit.ly/3paFb5Z"
//  },
