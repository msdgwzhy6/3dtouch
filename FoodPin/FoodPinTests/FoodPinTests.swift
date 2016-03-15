//
//  FoodPinTests.swift
//  FoodPinTests
//
//  Created by yagamis on 16/3/9.
//  Copyright © 2016年 xiaobo. All rights reserved.
//

import XCTest
@testable import FoodPin

class FoodPinTests: XCTestCase {
    var vc : RestaurantTableViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        vc = storyboard.instantiateViewControllerWithIdentifier("restaurantsTableView") as! RestaurantTableViewController
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    

    
    func testSearchFilter(){
        vc.viewDidLoad()
        vc.searchFilter("Duck")
        print("搜索结果：",vc.sr.count,"餐馆：",vc.restaurants.count)
        XCTAssert(vc.sr.count == 1)
    }
    
    
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
