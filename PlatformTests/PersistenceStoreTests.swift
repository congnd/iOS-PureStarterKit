import XCTest
import Domain
@testable import Platform

struct PersistenceStoreStub {
  @PersistenceStore(duration: 0.1, key: .quotes)
  var quotes: String?
}

class PersistenceStoreTests: XCTestCase {
  func test_persistingCorrectness() {
    var sut1 = PersistenceStoreStub()
    sut1.quotes = "123"

    let sut2 = PersistenceStoreStub()

    XCTAssertEqual(sut2.quotes, "123")
    XCTAssertEqual(sut2.quotes, sut1.quotes)
  }

  func test_expiringCorrectness() {
    var sut1 = PersistenceStoreStub()
    sut1.quotes = "123"

    let exp = XCTestExpectation()

    let sut2 = PersistenceStoreStub()
    XCTAssertEqual(sut2.quotes, "123")
    XCTAssertEqual(sut2.quotes, sut1.quotes)

    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
      XCTAssertNil(sut1.quotes)
      XCTAssertNil(sut2.quotes)
      exp.fulfill()
    }

    wait(for: [exp], timeout: 1)
  }
}
