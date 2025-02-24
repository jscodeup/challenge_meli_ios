import Foundation

class ProductListViewModel {
    
    // Closure para notificar cambios en los productos
    var onProductsUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    
    // Lista de productos obtenida del servicio
    private(set) var products: [Product] = [] {
        didSet {
            onProductsUpdated?()
        }
    }
    
    private let productService: ProductRepository
    
    init(productService: ProductRepository = ProductService()) { 
        self.productService = productService
    }
    
    // Obtiene los productos desde la API y actualiza la lista
    func fetchProducts(for query: String = "") {
        let searchQuery = query.isEmpty ? "QUERY" : query
        
        productService.searchProducts(query: searchQuery) { [weak self] result in
            switch result {
            case .success(let products):
                self?.products = products
            case .failure(let error):
                self?.onError?("No se pudieron cargar los productos. Verifica tu conexión.")
                print("Error al obtener productos: \(error.localizedDescription)")
            }
        }
    }
}
