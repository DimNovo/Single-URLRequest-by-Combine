//
//  Comment.swift
//  Single URLRequest by Combine
//
//  Created by Dmitry Novosyolov on 12/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id: Int
    let name, email, body: String
}
