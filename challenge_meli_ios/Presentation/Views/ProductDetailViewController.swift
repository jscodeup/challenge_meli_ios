//
//  ProductDetailViewController.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
import UIKit
import Kingfisher

class ProductDetailViewController: UIViewController {
    private let viewModel = ProductDetailViewModel()
    private let productId: String
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let productImageView = UIImageView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let brandLabel = UILabel()
    private let locationLabel = UILabel()
    private let warrantyLabel = UILabel()
    private let conditionLabel = UILabel()
    private let mercadoPagoLabel = UILabel()
    private let freeShippingLabel = UILabel()

    init(productId: String) {
        self.productId = productId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel.fetchProductDetail(productId: productId)
        titleLabel.accessibilityIdentifier = "detailTitle"
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Detalles del Producto"

        // Configurar ScrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        // Configuración de imagen
        productImageView.contentMode = .scaleAspectFit
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        // Configuración de labels
        [titleLabel, priceLabel, brandLabel, locationLabel, warrantyLabel, conditionLabel, mercadoPagoLabel, freeShippingLabel].forEach {
            $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            $0.numberOfLines = 0
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        titleLabel.textAlignment = .center
        priceLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        priceLabel.textColor = .systemGreen
        priceLabel.textAlignment = .center

        let stackView = UIStackView(arrangedSubviews: [productImageView, titleLabel, priceLabel, brandLabel, locationLabel, warrantyLabel, conditionLabel, mercadoPagoLabel, freeShippingLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)

        // Activar restricciones para ScrollView y ContentView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupBindings() {
        viewModel.onDetailLoaded = { [weak self] product in
            DispatchQueue.main.async {
                self?.updateUI(with: product)
            }
        }

        viewModel.onError = { errorMessage in
            DispatchQueue.main.async {
                print("Error: \(errorMessage)")
            }
        }
    }

    private func updateUI(with product: ProductDetail) {
        titleLabel.text = product.title
        priceLabel.text = NumberFormatterHelper.shared.formatPrice(product.price)
        brandLabel.text = "Marca: \(product.brand ?? "No especificado")"
        locationLabel.text = "Ubicación: \(product.location ?? "No disponible")"
        warrantyLabel.text = "Garantía: \(product.warranty ?? "No especificada")"
        conditionLabel.text = "Condición: \(product.condition.capitalized)"
        mercadoPagoLabel.text = product.acceptsMercadoPago ? "Acepta MercadoPago" : "No acepta MercadoPago"
        freeShippingLabel.text = product.freeShipping ? "Envío Gratis" : "Envío con costo"

        if let firstImageURL = product.pictures.first?.url {
            let secureURL = firstImageURL.replacingOccurrences(of: "http://", with: "https://")
            print("Cargando imagen desde URL: \(secureURL)")
            productImageView.kf.setImage(with: URL(string: secureURL), placeholder: UIImage(systemName: "photo"))
        } else {
            print("No se encontraron imágenes para este producto.")
        }
    }
}
