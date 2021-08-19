//
//  PrefectureModel.swift
//  chyamadaKadai9
//
//  Created by toaster on 2021/08/19.
//

import Foundation

enum PrefectureList: Int {
    case tokyo = 1
    case kanagawa
    case saitama
    case chiba

    var name: String {
        switch self {
        case .tokyo:
            return "東京都"
        case .kanagawa:
            return "神奈川県"
        case .saitama:
            return "埼玉県"
        case .chiba:
            return "千葉県"
        }
    }
}
