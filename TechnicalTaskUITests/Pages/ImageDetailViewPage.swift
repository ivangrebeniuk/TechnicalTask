//
//  ImageDetailViewPage.swift
//  TechnicalTaskUITests
//
//  Created by Иван Гребенюк on 10.08.2022.
//

import Foundation
import XCTest

private extension String {
    static let allPhotosButton = "All Photos"
}

final class ImageDetailViewPage: BasePage {
        
    // MARK: - Elements
    
    private lazy var allPhotosButton = app.navigationBars.buttons[.allPhotosButton]
    
    // MARK: - Asserts

    func tapAllPhotosButton() {
        allPhotosButton.tap()
    }
    
        
    // MARK: - Asserts
    
    func assertAllPhotosButtonIsDisplayed() {
        XCTAssert(allPhotosButton.waitForExistence(timeout: 2)
)
    }
}
