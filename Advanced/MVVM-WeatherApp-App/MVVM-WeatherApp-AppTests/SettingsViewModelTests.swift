//
//  SettingsViewModelTests.swift
//  MVVM-WeatherApp-AppTests
//
//  Created by ArunSha on 14/05/21.
//

import XCTest
@testable import MVVM_WeatherApp_App

class SettingsViewModelTests: XCTestCase {
    
    var settingsVM: SettingsViewModel!
    var userDef = UserDefaults.standard

    override func setUp() {
        // SETUP func call all the time before every method is getting invoke
        self.settingsVM = SettingsViewModel()
        userDef = UserDefaults.standard
    }
    
    func test_userDefinedUnitNotNil() {
        XCTAssertNotNil(userDef.value(forKey:"SettingsSelectedUnit"))
    }
    
    func test_equalUserDefUnitValueToSelectedUnit() {
        XCTAssertEqual( self.settingsVM.selectedUnit.rawValue , userDef.value(forKey:"SettingsSelectedUnit") as! String)
    }
    
    override class func tearDown() {
        // this method will call finally like destroy
        // clear User defaults
        UserDefaults.standard.removeObject(forKey: "SettingsSelectedUnit")
    }
}
