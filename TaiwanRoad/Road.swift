//
//  Road.swift
//  TaiwanRoad
//
//  Created by 林祔利 on 2023/5/2.
//

import Foundation
import UIKit

struct City: Decodable {
    let name: String
    let districts: [District]
}

struct District: Decodable {
    let zip: String
    let name: String
}

extension City {
    static var data: [Self] {
        guard let data = NSDataAsset(name: "taiwanDistricts")?.data else {
            return []
        }
        return (try? JSONDecoder().decode([Self].self, from: data)) ?? []
    }
}
