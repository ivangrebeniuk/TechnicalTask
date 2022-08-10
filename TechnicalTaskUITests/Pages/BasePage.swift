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
        deleteButton.tap()
    }
    
    func tapDeletePhotoButton() {
        deletePhotoButton.tap()
    }
    
    // MARK: - Asserts
    
    func assertDeleteButtonIsDisplayed() {
        XCTAssert(deleteButton.exists)
    }
    
    func assertDeletePhotoButtonIsDisplayed() {
        XCTAssert(deletePhotoButton.waitForExistence(timeout: 2))
    }
    
    func assertNavBarIsDisplayed() {
        XCTAssert(navBar.waitForExistence(timeout: 2))
    }
}

extension XCUIElement {
  func labelContains(text: String) -> Bool {
    let predicate = NSPredicate(format: "label CONTAINS %@", text)
    return staticTexts.matching(predicate).firstMatch.exists
  }
}
