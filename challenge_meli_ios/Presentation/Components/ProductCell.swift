//
//  ProductCell.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
import UIKit
import Kingfisher

class ProductCell: UITableViewCell {
    private let productImageView = UIImageView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // Configuración de la imagen
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 10
        productImageView.translatesAutoresizingMaskIntoConstraints = false

        // Configuración de los labels
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        priceLabel.textColor = .systemBlue
        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        // Contenedor vertical para título y precio
        let textStackView = UIStackView(arrangedSubviews: [titleLabel, priceLabel])
        textStackView.axis = .vertical
        textStackView.spacing = 4
        textStackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(productImageView)
        contentView.addSubview(textStackView)

        NSLayoutConstraint.activate([
            // Imagen del producto
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 120),
            productImageView.heightAnchor.constraint(equalToConstant: 120),

            // Stack de texto
            textStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 15),
            textStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            textStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = "$\(product.price)"

        let secureThumbnail = product.thumbnail.replacingOccurrences(of: "http://", with: "https://")
        if let url = URL(string: secureThumbnail) {
            productImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
    }
}

