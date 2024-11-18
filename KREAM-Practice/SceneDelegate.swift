//
//  SceneDelegate.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/23/24.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        KakaoSDK.initSDK(appKey: "4890e2932b2cf8fc976f7e149cdc37ff")
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()

    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        for context in URLContexts {
                print("url: \(context.url.absoluteURL)")
                print("scheme: \(context.url.scheme)")
                print("host: \(context.url.host)")
                print("path: \(context.url.path)")
                print("components: \(context.url.pathComponents)")
              }
        // URLContexts에서 첫 번째 URL 가져오기
        guard let url = URLContexts.first?.url else { return }
        
        // Custom URL Scheme인지 확인
        if url.scheme == "kakao4890e2932b2cf8fc976f7e149cdc37ff" {
            print("Received Redirect URL: \(url.absoluteString)")
            
            // URLComponents로 쿼리 파라미터 추출
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            
            // Authorization Code 가져오기
            if let code = components?.queryItems?.first(where: { $0.name == "code" })?.value {
                print("Authorization Code: \(code)")
                
                // Access Token 요청
                KakaoLoginHelper().requestAccessToken(authCode: code)
            } else if let error = components?.queryItems?.first(where: { $0.name == "error" })?.value {
                print("Error: \(error)")
            }
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

