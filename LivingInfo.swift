//
//  LivingInfo.swift
//  LivingRooms
//
//  Created by luis reynaldo cedeno manzanilla on 22.07.19.
//  Copyright © 2019 App-Designer2. All rights reserved.
//

import Foundation
import SwiftUI

struct Livingroom: Hashable, Codable, Identifiable {
    let id: Int
    let names,image,msg,detail,more: String
    init(id: Int, names: String, image: String, msg: String,detail: String,more: String) {
        self.id = id
        self.names = names
        self.image = image
        self.msg = msg
        self.detail = detail
        self.more = more
        
        enum LivingRooms:  String,CaseIterable,Codable,Hashable {
            case living = "living"
            case rooms = "rooms"
        }
    }
}
