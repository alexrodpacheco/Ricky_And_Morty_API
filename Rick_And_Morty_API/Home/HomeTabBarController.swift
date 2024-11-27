import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let characterViewController = CharacterViewController()
        let locationViewController = LocationViewController()
        let episodeViewController = EpisodeViewController()
        let settingsViewController = SettingsViewController()
        
        //Refactor - set viewcontrollers title in current class
        characterViewController.navigationItem.largeTitleDisplayMode = .automatic
        locationViewController.navigationItem.largeTitleDisplayMode = .automatic
        episodeViewController.navigationItem.largeTitleDisplayMode = .automatic
        settingsViewController.navigationItem.largeTitleDisplayMode = .automatic
        
        let characterTab = UINavigationController(rootViewController: characterViewController)
        let locationTab = UINavigationController(rootViewController: locationViewController)
        let episodeTab = UINavigationController(rootViewController: episodeViewController)
        let settingsTab = UINavigationController(rootViewController: settingsViewController)
        
        characterTab.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person"), tag: 1)
        locationTab.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "globe"), tag: 2)
        episodeTab.tabBarItem = UITabBarItem(title: "Episode", image: UIImage(systemName: "tv"), tag: 3)
        settingsTab.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        setViewControllers([characterTab, locationTab, episodeTab, settingsTab], animated: true)
    }
}

