//
//  DataManager.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit
import Alamofire

protocol LocDelegate {
    func didSuccessGetLocs(locs: [Loc])
    func failedToRequest(_ message: String)
}

struct LocParams: Encodable {
    let latitude: Double
    let longitude: Double
    
}

struct LocResponse: Decodable {
    let treasureLists: [Loc]?
}

struct Loc: Decodable {
    let dislikeCnt: Int?
    let distance: Double?
    let hashTag: String?
    let latitude: Double?
    let longitude: Double?
    let likeCnt: Int?
    let treasureId: Int?
}

class DataManager {
    func getLocs(lat: Double, long: Double, delegate: LocDelegate) {
        AF.request("https://sideproject.shop/treasures?longitude=127.0498611296675&latitude=37.549153365252195", method: .get)
            .validate()
            .responseDecodable(of: LocResponse.self) { response in
                print("response: \(response) ")
                switch response.result {
                case .success(let response):
                    delegate.didSuccessGetLocs(locs: response.treasureLists ?? [])
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest("서버와 연결이 원활하지 않습니다")
                }
            }
    }
}
