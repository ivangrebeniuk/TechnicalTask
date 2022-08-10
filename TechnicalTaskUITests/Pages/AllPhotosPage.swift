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
        firstImage.tap()
    }
    
    // MARK: - Asserts
    
    func assertNavigationBarIsDisplayed() {
        XCTAssert(screenIdentifier.waitForExistence(timeout: 3), "Navigation 'All Photos' bar is not displayed")
    }
    
    func assertAmountOfPhotosIsReducedByOne(amountOfPhotosBeforeDeleting: Int) {
        let currentAmountOfPhotos =  app.collectionViews.cells.count
        XCTAssertNotEqual(amountOfPhotosBeforeDeleting, currentAmountOfPhotos,
                       "Amount of photos is equal, but it should not be. Before: \(amountOfPhotosBeforeDeleting), afterDeleting: \(currentAmountOfPhotos)")
    }
    
    func assertDeletedPhotoIsNotDisplayed(_ deletedPhotoLabel: String) {
        XCTAssertFalse(firstImage.label.contains(deletedPhotoLabel),
                       "Already deleted image with label '\(deletedPhotoLabel)' is displayed. but it should not be")
    }
}
