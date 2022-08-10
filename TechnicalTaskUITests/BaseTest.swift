//
//  BaseTest.swift
//  TechnicalTaskUITests
//
//  Created by Иван Гребенюк on 10.08.2022.
//

import XCTest

class BaseTest: XCTestCase {
    
    public lazy var app: XCUIApplication = XCUIApplication(bundleIdentifier: "com.apple.mobileslideshow")
    
    override func setUp() {
        super.setUp()
        app.launch()
        
        handleNotificationsPermission()
        NewsPage().closeWhatsNewScreen()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
    
    // MARK: - Private
    
    private func handleNotificationsPermission() {
        addUIInterruptionMonitor(withDescription: "Local Notifications") { (alert) -> Bool in
            let notifPermission = "Would Like to Send You Notifications"
            if alert.labelContains(text: notifPermission) {
                alert.buttons["Allow"].tap()
                return true
            }
            return false
        }
    }
}

