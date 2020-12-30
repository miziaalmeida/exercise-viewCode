import Foundation

protocol ProductsListViewModelProtocol {
    var products: [Product] { get }
    func listProducts()
}

class ProductsListViewModel: ProductsListViewModelProtocol{
    let service: APIService
    var products: [Product] = []
    weak var viewController: ProductsListEvents?
    
    init(service: APIService) {
        self.service = service
    }
    
    func listProducts() {
        service.getData(path: ServicePath.products) { (result) in
            switch result {
            case .success(let data):
                
                    self.products = self.createProducts(data: data)
                    self.viewController?.didLoadProducts()
                
            case .failure(let error):
                self.viewController?.showError(message: error.localizedDescription)
            }
        }
    }
    
    private func createProducts(data: Data) -> [Product] {
        var products = [Product]()
        do {
            let createdProduct = try JSONDecoder().decode([Product].self, from: data)
            products = createdProduct
        } catch { }
        return products
    }
}
