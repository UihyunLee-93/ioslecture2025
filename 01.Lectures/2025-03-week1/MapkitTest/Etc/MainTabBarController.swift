import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupTabBarStyle()
        addBlurEffectToTabBar()
    }
    
    private func setupTabs() {
        let mapVC = MapKitViewController()
        mapVC.tabBarItem = UITabBarItem(title: "지도", image: UIImage(systemName: "map"), selectedImage: UIImage(systemName: "map.fill"))

        let musicVC = MusicRecommendationViewController()
        musicVC.tabBarItem = UITabBarItem(title: "음악 추천", image: UIImage(systemName: "music.note.list"), selectedImage: UIImage(systemName: "music.note.list"))

        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: "나", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
        
        viewControllers = [mapVC, musicVC, profileVC]
    }

    private func setupTabBarStyle() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(hex: "#ff8f8a")
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(hex: "#ff7069")
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor(hex: "#ff7069")
    }

    private func addBlurEffectToTabBar() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = tabBar.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        tabBar.addSubview(blurView)
        tabBar.sendSubviewToBack(blurView) 
    }
}
