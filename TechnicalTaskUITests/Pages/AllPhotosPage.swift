//
//  AllPhotosPage.swift
//  TechnicalTaskUITests
//
//  Created by Иван Гребенюк on 10.08.2022.
//

import Foundation
import XCTest

private extension String {
    static let screenIdentifier = "All Photos"
    static let selectButtonLabel = "Select"
}

final class AllPhotosPage: BasePage {
    
    
    // MARK: - Elements
    
    private lazy var screenIdentifier = app.navigationBars[.screenIdentifier]
    private lazy var firstImage = app.collectionViews.cells.firstMatch
    
    
    
    // MARK: - Actions
    
    func getAmountOfImages() -> Int {
        return app.collectionViews.cells.count
    }
    
    func getLabelOfFirstImage() -> String {
        return firstImage.label
    }
    
    func tapFirstImage() {
        step(named: "Tap first image in Collection View") {
            firstImage.tap()
        }
    }
    
    // MARK: - Asserts
    
    func assertNavigationBarIsDisplayed() {
        step(named: "Check that nav bar is displayed on All Photos screen") {
            XCTAssert(screenIdentifier.waitForExistence(timeout: 3), "Navigation 'All Photos' bar is not displayed")
        }
    }
    
    func assertAmountOfPhotosIsReducedByOne(amountOfPhotosBeforeDeleting: Int) {
        let currentAmountOfPhotos =  app.collectionViews.cells.count
        step(named: "Assert current amount of photos on All Photos screen is one less then before deleting: '\(amountOfPhotosBeforeDeleting)'") {
            XCTAssertNotEqual(amountOfPhotosBeforeDeleting, currentAmountOfPhotos)
        }
    }
    
    func assertDeletedPhotoIsNotDisplayed(_ deletedPhotoLabel: String) {
        step(named: "Assert already deleted photo with label '\(deletedPhotoLabel)' is not displayed") {
            XCTAssertFalse(firstImage.label.contains(deletedPhotoLabel))
        }
    }
}
