//
//  NewsPage.swift
//  TechnicalTaskUITests
//
//  Created by Иван Гребенюк on 10.08.2022.
//

import Foundation
import XCTest

private extension String {
    static let screenTitle = "What’s New in Photos'"
    static let continueButtonLabel = "Continue"
}

final class NewsPage: BasePage {
        
    // MARK: - Elements
    
    private lazy var continueButton = app.buttons[.continueButtonLabel]
    private lazy var whatsNewTitle = app.staticTexts[.screenTitle]
    
    // MARK: - Actions
    
    func closeWhatsNewScreen() {
        if continueButton.waitForExistence(timeout: 3) {
            continueButton.tap()
        }
    }
    
    // MARK: - Asserts
    
    func assertContinueButtonIsDisplayed() {
        XCTAssert(continueButton.waitForExistence(timeout: 3))
    }
    
}
