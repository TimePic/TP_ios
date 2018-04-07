//
//  StringsLocalized.swift
//  TotoroTalk
//
//  Created by Li Shuzu on 7/04/18.
//  Copyright © 2018 TimePic. All rights reserved.
//

import Foundation

// MARK: Localized
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
