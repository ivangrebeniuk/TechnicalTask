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
    
    // MARK: - Actions
    
    func closeWhatsNewScreen() {
        step(named: "Close interrupting What's New screen after first launch") {
            if continueButton.waitForExistence(timeout: 3) {
                continueButton.tap()
            }
        }
    }
    
    // MARK: - Asserts
    
    func assertContinueButtonIsDisplayed() {
        step(named: "Assert 'Continue' button is displayed") {
            XCTAssert(continueButton.waitForExistence(timeout: 2))

        }
    }
}
