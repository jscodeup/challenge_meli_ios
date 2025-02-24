//
//  ProductListViewController.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
import UIKit
import FirebaseCrashlytics

class ProductListViewController: UIViewController {
    
    private let tableView = UITableView()
    private let searchBar = UISearchBar()
    
    private let viewModel = ProductListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fatalError("Crash de prueba enviado a Crashlytics")
        setupUI()
        setupBindings()
        viewModel.fetchProducts()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Productos"
        
        // Configurar SearchBar
        searchBar.placeholder = "Buscar productos..."
        searchBar.delegate = self
        
        // Configurar TableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        
        // Agregar subviews
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        // Activar AutoLayout
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupBindings() {
        viewModel.onProductsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.onError = { [weak self] message in
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(alert, animated: true)
                }
            }

    }
}

// MARK: - UITableViewDataSource
extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let product = viewModel.products[indexPath.row]
        cell.configure(with: product)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ProductListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedProduct = viewModel.products[indexPath.row]
        let detailVC = ProductDetailViewController(productId: selectedProduct.id)
        print("ID:", selectedProduct.id)
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

// MARK: - UISearchBarDelegate
extension ProductListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
        viewModel.fetchProducts(for: query)
        searchBar.resignFirstResponder()
    }
}
