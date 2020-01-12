//
//  CommentsViewModel.swift
//  Single URLRequest by Combine
//
//  Created by Dmitry Novosyolov on 12/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation
import Combine

final class CommentsViewModel: ObservableObject {
    private lazy var netService = NetService()
    private var cancellable: AnyCancellable?
    @Published var comments = [Comment]()
    
    init() {
        cancellable =
            netService
                .getComments()
                .receive(on: RunLoop.main)
                .catch { _ in Just(self.comments)}
                .assign(to: \.comments, on: self)
        
    }
}
