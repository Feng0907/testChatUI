//
//  ChatView.swift
//  testChatUI
//
//  Created by Feng on 2025/2/16.
//

import SwiftUI

struct ChatView: View {
    @State private var messages: [Message] = (0..<10000).map { index in
        Message(
            senderName: index % 2 == 0 ? "Alice" : "我",
            senderImage: index % 2 == 0 ? "person.fill" : "person.crop.circle.fill",
            text: "這是第 \(index + 1) 則測試訊息",
            image: nil,
            isMe: index % 2 != 0,
            timestamp: Calendar.current.date(byAdding: .second, value: -index, to: Date())!,
            roleIcon: index % 5 == 0 ? "star.fill" : nil // 每 5 筆加一個管理員圖示
        )
    }

    @State private var newMessage = ""

    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                ScrollViewReader { scrollView in
                    ScrollView {
                        LazyVStack {
                            ForEach(messages) { message in
                                ChatBubbleView(message: message)
                                    .id(message.id)
                            }
                        }
                    }
                    .onChange(of: messages.count) { _, _ in
                        withAnimation {
                            scrollView.scrollTo(messages.last?.id, anchor: .bottom)
                        }
                    }
                }

            }

            HStack {
                TextField("輸入訊息...", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 40)
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .padding()
        }
    }

    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        let message = Message(senderName: "我", senderImage: "person.crop.circle.fill", text: newMessage, image: nil, isMe: true, timestamp: Date(), roleIcon: nil)
        messages.append(message)
        newMessage = ""
    }
}


#Preview {
    ChatView()
}
