//
//  MessageModel.swift
//  testChatUI
//
//  Created by Feng on 2025/2/16.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let senderName: String
    let senderImage: String // 頭像 URL 或系統圖示
    let text: String?
    let image: String? // 圖片訊息
    let isMe: Bool
    let timestamp: Date
    let roleIcon: String? // 角色圖示（管理員）
}
