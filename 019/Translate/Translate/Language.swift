//
//  Language.swift
//  Translate
//
//  Created by JunHwan Kim on 2023/08/10.
//

import Foundation

enum Language: String, CaseIterable {
    case ko = "ko"
    case en = "en"
    case ja = "ja"
    case zhCN = "zh_CN"
    case zhTW = "zh_TW"
    case vi = "vi"
    case id = "id"
    case th = "th"
    case de = "de"
    case ru = "ru"
    case es = "es"
    case it = "it"
    case fr = "fr"
    
    var language: String {
        switch self {
        case .ko:
            return "한국어"
        case .en:
            return "영어"
        case .ja:
            return "일본어"
        case .zhCN:
            return "중국어 간체"
        case .zhTW:
            return "중국어 번체"
        case .vi:
            return "베트남어"
        case .id:
            return "인도네시아어"
        case .th:
            return "태국어"
        case .de:
            return "독일어"
        case .ru:
            return "러시아어"
        case .es:
            return "스페인어"
        case .it:
            return "이탈리아어"
        case .fr:
            return "프랑스어"
        }
    }
}
