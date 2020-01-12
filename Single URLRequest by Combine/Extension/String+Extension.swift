//
//  String+Extension.swift
//  Single URLRequest by Combine
//
//  Created by Dmitry Novosyolov on 12/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation

extension String {
    func capitalazingFirstLetter() -> String {
        prefix(1).localizedCapitalized + dropFirst()
    }
    
    mutating func capitalazeFirstLetter() {
        self = self.capitalazingFirstLetter()
    }
}
