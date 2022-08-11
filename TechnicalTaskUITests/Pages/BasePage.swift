//
//  BasePage.swift
//  TechnicalTaskUITests
//
//  Created by Иван Гребенюк on 10.08.2022.
//

import Foundation
import XCTest

private extension String {
    static let deleteIdentifier = "Delete"
    static let deletePhotoIdentifier = "Delete Photo"
    
}

class BasePage: BaseTest {
    
    // MARK: - Elements
    
    private lazy var deleteButton = app.buttons[.deleteIdentifier].firstMatch
    private lazy var deletePhotoButton = app.buttons[.deletePhotoIdentifier].firstMatch
    private lazy var navBar = app.navigationBars.firstMatch
    
    // MARK: - Elements
    
    func tapDeleteButton() {
        step(named: "Tap 'Delete' button") {
            deleteButton.tap()
        }
    }
    
    func tapDeletePhotoButton() {
        step(named: "Tap 'Delete Photo' button") {
            deletePhotoButton.tap()
        }
    }
    
    // MARK: - Asserts
    
    func assertDeleteButtonIsDisplayed() {
        step(named: "Assert 'Delete' button is diplayed") {
            XCTAssert(deleteButton.exists)
        }
    }
    
    func assertDeletePhotoButtonIsDisplayed() {
        step(named: "Assert 'Delete Photo' button is diplayed") {
            XCTAssert(deletePhotoButton.waitForExistence(timeout: 2))
        }
    }
    
    func assertNavBarIsDisplayed() {
        step(named: "Assert navigation bar is displayed") {
            XCTAssert(navBar.waitForExistence(timeout: 2))
        }
    }
}

extension BasePage {
    
    func step(named name: String, activity: () -> Void) {
        XCTContext.runActivity(named: "\(name)") { _ in
            activity()
        }
    }
}

extension XCUIElement {
  func labelContains(text: String) -> Bool {
    let predicate = NSPredicate(format: "label CONTAINS %@", text)
    return staticTexts.matching(predicate).firstMatch.exists
  }
}
