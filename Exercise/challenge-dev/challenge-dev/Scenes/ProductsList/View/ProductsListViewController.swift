import UIKit

protocol ProductsListEvents: AnyObject {
    func didLoadProducts()
    func showError(message: String)
}

class ProductsListViewController: UIViewController {
    
    var tableView = UITableView()
    var safeArea: UILayoutGuide!
    var api = APIService()
    
    var product: [Product] = []
    
    var viewModel: ProductsListViewModelProtocol
    
    init(viewModel: ProductsListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.safeAreaLayoutGuide
        
        setupTableView()
        
        viewModel.listProducts()
    }
    
    func setupTableView(){
        //add TableView
        view.addSubview(tableView)
        
        tableView.pin(to: view)
        
        setTableViewDelegates()
        
        setRegisterCell()
        
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setRegisterCell(){
        tableView.register(ProductsListTableViewCell.self, forCellReuseIdentifier: "productsCell")
    }
    
}

extension ProductsListViewController: UITableViewDelegate{
    
}

extension ProductsListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell") as! ProductsListTableViewCell
        
        let product = viewModel.products[indexPath.row]
        
        cell.setup(product: product)
        
        return cell
    }
}

extension ProductsListViewController: ProductsListEvents {
    func didLoadProducts() {
        tableView.reloadData()
    }
    
    func showError(message: String) {
    }
}

extension UIView {
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

