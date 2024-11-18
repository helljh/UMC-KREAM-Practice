//
//  KakaoLoginHelper.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/17/24.
//

import Foundation
import Alamofire
import UIKit

class KakaoLoginHelper {
    static let REST_API_KEY: String = "bd96943c12e1f49673f3b09d062e30a3"
    static let REDIRECT_URI: String = "http://kakao4890e2932b2cf8fc976f7e149cdc37ff/oauth"
    func getKakaoAuthorize() {
        let url = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=\(KakaoLoginHelper.REST_API_KEY)&redirect_uri=\(KakaoLoginHelper.REDIRECT_URI)"
        if let loginUrl = URL(string: url) {
            UIApplication.shared.open(loginUrl, options: [:], completionHandler: nil)
        }
    }
    
    func requestAccessToken(authCode: String) {
        let url = "https://kauth.kakao.com/oauth/token"
        let parameters: [String: Any] = [
            "grant_type": "authorization_code",
            "client_id": KakaoLoginHelper.REST_API_KEY,
            "redirect_uri": KakaoLoginHelper.REDIRECT_URI,
            "code": authCode
        ]
        
        AF.request(url, method: .post, parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    if let json = data as? [String: Any],
                       let accessToken = json["access_token"] as? String {
                        print("Access Token: \(accessToken)")
                        // Access Token 저장 및 이후 API 요청
                    }
                case .failure(let error):
                    print("Access Token 요청 실패: \(error.localizedDescription)")
                }
            }
    }
    
    func getKakaoUserInfo(accessToken: String, completion: @escaping (String?) -> Void){
        let url = "https://kapi.kakao.com/v2/user/me"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)"
        ]
        
        AF.request(url, method: .get, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    if let userData = data as? [String: Any],
                       let properties = userData["properties"] as? [String: Any],
                       let nickname = properties["nickname"] as? String {
                        print("사용자 닉네임: \(nickname)")
                        completion(nickname)
                    } else {
                        print("사용자 닉네임을 가져올 수 없습니다.")
                        completion(nil)
                    }
                    
                case .failure(let error):
                    print("사용자 정보 요청 실패: \(error.localizedDescription)")
                    completion(nil)
                }
            }
    
    }
    
    
}
