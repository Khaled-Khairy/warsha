import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        // Prevent screenshots by blurring the content
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didEnterBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(willEnterForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    @objc func didEnterBackground() {
        if let window = UIApplication.shared.windows.first {
            let blurEffect = UIBlurEffect(style: .light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = window.bounds
            blurEffectView.tag = 1000
            window.addSubview(blurEffectView)
        }
    }

    @objc func willEnterForeground() {
        if let window = UIApplication.shared.windows.first {
            if let blurEffectView = window.viewWithTag(1000) {
                blurEffectView.removeFromSuperview()
            }
        }
    }
}
