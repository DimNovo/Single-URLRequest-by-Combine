//
//  ContentView.swift
//  Single URLRequest by Combine
//
//  Created by Dmitry Novosyolov on 12/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var commentsVM = CommentsViewModel()
    var body: some View {
        ZStack {
            Color.init(colorScheme == .dark ? .systemBlue : .systemIndigo)
                .edgesIgnoringSafeArea(.all)
            NavigationView {
                List {
                    ForEach(commentsVM.comments) { comment in
                        VStack(alignment: .leading, spacing: 5) {
                            HStack(alignment: .firstTextBaseline) {
                                Image(systemName: "envelope")
                                    .font(.subheadline)
                                Text(comment.email)
                                    .foregroundColor(.blue)
                                    .onTapGesture { print("Send email to: \(comment.email)")}
                                Divider()
                                .frame(height: 14)
                                    .background(Color.primary)
                                Spacer()
                                Text("ID: \(comment.id)")
                            }
                            .font(.caption)
                            Text(comment.name.capitalazingFirstLetter())
                                .font(.headline)
                            Text(comment.body.capitalazingFirstLetter())
                                .lineLimit(nil)
                                .font(.system(size: 17, weight: .light, design: .rounded))
                        }
                    }
                    .padding(7)
                }.navigationBarItems(trailing: Text("\(commentsVM.comments.count)").foregroundColor(.pink))
                .navigationBarTitle("Comments")
            }.opacity(0.8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
