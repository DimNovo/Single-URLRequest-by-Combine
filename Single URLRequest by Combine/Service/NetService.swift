//
//  NetService.swift
//  Single URLRequest by Combine
//
//  Created by Dmitry Novosyolov on 12/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation
import Combine

final class NetService {
    
    func getComments() -> AnyPublisher<[Comment], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments")
            else { fatalError("Invalid URL!")}
        return
            URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Comment].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
