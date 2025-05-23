//
//  ChatBubbleView.swift
//  testChatUI
//
//  Created by Feng on 2025/2/16.
//

import SwiftUI

struct ChatBubbleView: View {
    let message: Message

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            if !message.isMe {
                // 左側訊息（其他人）
                Image(systemName: message.senderImage)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .foregroundStyle(Color.gray)

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(message.senderName)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        if let roleIcon = message.roleIcon {
                            Image(systemName: roleIcon) // "star.fill" 代表管理員
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.yellow)
                        }
                    }
                    if let text = message.text {
                        Text(text)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(12)
                            .frame(maxWidth: 250, alignment: .leading)
                    }
                    if let image = message.image {
                        Image(systemName: image)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(8)
                    }
                }
                Spacer()
            } else {
                // 右側訊息（自己）
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    if let text = message.text {
                        Text(text)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .frame(maxWidth: 250, alignment: .trailing)
                    }
                    if let image = message.image {
                        Image(systemName: image)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}


