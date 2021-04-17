//
//  Defintions.swift
//  CheatManager
//
//  Created by evelyn on 2021-04-16.
//

import Foundation

public struct FeaturedPage {
    struct CardPackage {
        let imglink: String
        let title: String
        let mod: Mod
    }
    struct Package {
        let iconlink: URL?
        let title: String
        let maintainer: String
    }
}

public struct Mod {
    var icon: String
    var name: String
    var id: String
    var gameBundleID: String
    var gameName: String
    var maintainer: String
    enum type {
        case singular
        case multi
        case undefined
    }
    enum level {
        case simple
        case advanced
        case lowlevel
    }
    enum origin { // backport flex 3 patches?
        case native
        case flex3
    }
}
