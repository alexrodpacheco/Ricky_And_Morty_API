import UIKit

class CharacterListView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let homeViewModel = CharacterViewModel()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
        return collection
    }()
    
    private var loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .large)
        loading.hidesWhenStopped = true
        loading.translatesAutoresizingMaskIntoConstraints = false
        return loading
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.dataSource = self
        collectionView.delegate = self
        translatesAutoresizingMaskIntoConstraints = false
        buildHierarchy()
        layoutConstraints()
        loading.startAnimating()
        homeViewModel.loadHomeData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHierarchy() {
        addSubview(loading)
        addSubview(collectionView)
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            loading.widthAnchor.constraint(equalToConstant: 100),
            loading.heightAnchor.constraint(equalToConstant: 100),
            loading.centerXAnchor.constraint(equalTo: centerXAnchor),
            loading.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath)
        DispatchQueue.main.async {
            self.loading.stopAnimating()
            cell.backgroundColor = .blue
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenBounds = UIScreen.main.bounds
        let width = (screenBounds.width-30)/2
        return CGSize(width: width, height: width * 1.5)
    }
}
