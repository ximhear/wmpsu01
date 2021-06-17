//
//  WmpListModel.swift
//  WmpSU01
//
//  Created by gzonelee on 2021/06/18.
//

import Foundation

/*
 "id": 1257,
 "bannerTitle": "빈방특가",
 "bannerName": "빈방특가",
 "bannerDesc": "빈방특가",
 "imgUrl": "",
 "linkUrl": "",
 "bgColor": "",
 "appLink": "",
 "pcImgUrl": "https://event.wd.wemakeprice.com/tour/icon/main/200924/pension.png",
 "pcLinkUrl": "https://tour.wd.wemakeprice.com/khotel/list/hotel?todaySpecial=1",
 "pcLinkTarget": "Self",
 "pcBgColor": "",
 "sortNumber": 3,
 "startDate": "2020-06-29",
 "endDate": "2030-12-31",
 "useYn": true,
 "bannerGroupId": 51
 */

struct Banner: Codable {
    let id: Int
    let bannerTitle: String
    let bannerName: String
    let bannerDesc: String
    let imgUrl: String
    let linkUrl: String
    let bgColor: String
    let appLink: String
    let pcImgUrl: String
    let pcLinkUrl: String
    let pcLinkTarget: String
    let pcBgColor: String
    let sortNumber: Int
    let startDate: String
    let endDate: String
    let useYn: Bool
    let bannerGroupId: Int

}
/*
 "id": 51,
 "name": "[PC] 투어검색 탭메뉴",
 "code": "TSPTAB",
 "action": "rolling",
 "used": true,
 */
struct BannerResult: Codable {
    let id: Int
    let name: String
    let code: String
    let action: String
    let used: Bool
    let bannerList: [Banner]
}
enum WmpError: Error {
    case error
}
class WmpListModel: ObservableObject {
    
    @Published var banners: [Banner] = []
    
    func load() async {
       await _load()
    }
    
    func _load() async {
        do {
            let (data, response) = try await URLSession.shared.data(from: URL(string: "https://tour-api.wonders.app/v1/banner/TSPTAB")!)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw WmpError.error
            }
            print(response)
            print(data)
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(BannerResult.self, from: data)
            banners = decoded.bannerList
    
        } catch {
            print(error)
            banners = []
        }
   }
}
