//
//  WebDetailView.swift
//  WmpSU01
//
//  Created by gzonelee on 2021/06/21.
//

import SwiftUI

struct WebDetailView: View {
    var banner: Banner
    var body: some View {
        
        VStack {
            Text(banner.pcLinkUrl)
            VStack {
                WebView(url: banner.pcLinkUrl)
            }
//            .background(.red)
        }
        .navigationTitle(banner.bannerName)
    }
}

struct WebDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let bannerStr = """
 {
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
 }
"""
        let data = bannerStr.data(using: .utf8)
        let decoder = JSONDecoder()
        let banner = try! decoder.decode(Banner.self, from: data!)
        
        WebDetailView(banner: banner)
    }
}
