import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let medicationListViewController = MedicationListViewController()
        
        let navigationController = UINavigationController(rootViewController: medicationListViewController)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

// Sources:
// https://developer.apple.com/documentation/uikit/uiapplicationdelegate
//https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle
