//
//  CryptoRankingTDDTests.swift
//  CryptoRankingTDDTests
//
//  Created by MCS on 1/9/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import XCTest
@testable import CryptoRankingTDD

class CryptoRankingTDDTests: XCTestCase {

  var sut: DataGetter!
  var testData: Data {
    let dictionary = ["exampleKey": "exampleValue"]
    return try! JSONEncoder().encode(dictionary)
  }
  
  override func setUp() {
    super.setUp()
    sut = DataGetter()
  }

  override func tearDown() {
    sut = nil
    super.tearDown()
  }

  func testGetData() {
      // This is an example of a functional test case.
      // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    sut.getData(session: MockSession(data: testData)) {
      XCTAssertNotNil(sut.data)
    }
  }
  
}

final class MockSession: Session {
  let data: Data?
  
  init(data: Data?) {
    self.data = data
  }
  
  func getData(url: URL, completion: @escaping (Data?, Error?) -> Void) {
    completion(data, nil)
  }
}
