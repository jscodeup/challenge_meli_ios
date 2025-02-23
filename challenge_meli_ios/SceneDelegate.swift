import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Crear la ventana manualmente
        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: ProductListViewController())

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
