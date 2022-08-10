//
//  TechnicalTaskUITests.swift
//  TechnicalTaskUITests
//
//  Created by Иван Гребенюк on 10.08.2022.
//

import XCTest

class TechnicalTaskUITests: BaseTest {

    func testLaunchTheApp() {
        let allPhotosPage = AllPhotosPage()
        let imageDetailViewPage = ImageDetailViewPage()

        let amountOfImagesBeforeDeleting = allPhotosPage.getAmountOfImages()
        let labelOfDeletedImage = allPhotosPage.getLabelOfFirstImage()
        
        allPhotosPage.assertNavigationBarIsDisplayed()
        allPhotosPage.tapFirstImage()
        
        imageDetailViewPage.assertNavBarIsDisplayed()
        imageDetailViewPage.assertDeleteButtonIsDisplayed()
        imageDetailViewPage.tapDeleteButton()
        imageDetailViewPage.assertDeletePhotoButtonIsDisplayed()
        imageDetailViewPage.tapDeletePhotoButton()
        imageDetailViewPage.assertAllPhotosButtonIsDisplayed()
        imageDetailViewPage.tapAllPhotosButton()
        
        allPhotosPage.assertNavigationBarIsDisplayed()
        allPhotosPage.assertAmountOfPhotosIsReducedByOne(amountOfPhotosBeforeDeleting: amountOfImagesBeforeDeleting)
        allPhotosPage.assertDeletedPhotoIsNotDisplayed(labelOfDeletedImage)
    }
}
