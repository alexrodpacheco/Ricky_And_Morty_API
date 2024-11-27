import UIKit

class CharacterViewController: UIViewController {
    private let homeListView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        buildHierarchy()
        layoutConstraints()
    }
    
    private func buildHierarchy() {
        view.addSubview(homeListView)
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            homeListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            homeListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        ])
    }
}

