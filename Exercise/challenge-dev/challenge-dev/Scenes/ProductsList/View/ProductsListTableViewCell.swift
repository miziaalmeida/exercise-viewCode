import UIKit

class ProductsListTableViewCell: UITableViewCell {
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.tintColor = .black
        label.font = UIFont(name: "System", size: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var info: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.tintColor = .lightGray
        label.font = UIFont(name: "System", size: 15.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.tintColor = .blue
        label.font = UIFont(name: "System", size: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        [self.title,
         self.info].forEach { stack.addArrangedSubview($0) }
        
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCells()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCells(){
        addSubview(productImageView)
        addSubview(stackView)
        addSubview(price)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
//            productImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            productImageView.heightAnchor.constraint(equalToConstant: 100),
//            productImageView.widthAnchor.constraint(equalToConstant: 100),
//
//            title.centerYAnchor.constraint(equalTo: centerYAnchor),
//            title.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),
//            title.heightAnchor.constraint(equalToConstant: 20),
//            title.widthAnchor.constraint(equalToConstant: 80),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalToConstant: 20),
            stackView.widthAnchor.constraint(equalToConstant: 80),
            
            price.centerYAnchor.constraint(equalTo: centerYAnchor),
            price.leadingAnchor.constraint(equalTo: info.trailingAnchor, constant: 80),
            price.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            price.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func setup(product: Product){
        productImageView.image = UIImage(named: product.image)
        title.text = product.name
        info.text = product.description
        price.text = "R$ \(product.price)"
    }
}
