//
//  SettingsSection.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 1.03.2025.
//

import Foundation

protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}

enum SettingsSection: Int, CaseIterable, CustomStringConvertible {
    case Social
    case Communications
    
    var description: String {
        switch self {
        case .Social: return "Social"
        case .Communications: return "Communications"
        }
    }
}


enum SocialOptions: Int, CaseIterable, SectionType {
    var containsSwitch: Bool { return false }
    
    case editProfile
    case logout
    
    var description: String {
        switch self {
        case .editProfile: return "Edit Profile"
        case .logout: return "Logout"
        }
    }
}

enum CommunicationOptions: Int, CaseIterable, SectionType {
    var containsSwitch: Bool {
        switch self {
        case .notifications: return true
        case .email: return true
        case .reportCrashes: return false
        }
    }
    
    case notifications
    case email
    case reportCrashes
    
    var description: String {
        switch self {
        case .notifications: return "Notifications"
        case .email: return "Email"
        case .reportCrashes: return "Report Craches"
        }
    }
}
