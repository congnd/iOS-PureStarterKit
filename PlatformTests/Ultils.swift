import Foundation

class URLProtocolStub: URLProtocol {
  static var data: Data?
  static var numberOfCalls: Int = 0

  static let error = NSError(domain: "", code: 0, userInfo: nil)

  override class func canInit(with request: URLRequest) -> Bool {
    return true
  }

  override class func canonicalRequest(for request: URLRequest) -> URLRequest {
    return request
  }

  override func startLoading() {
    Self.numberOfCalls += 1

    Timer.scheduledTimer(withTimeInterval: 0.05, repeats: false) { _ in
      if let data = Self.data {
        self.client?.urlProtocol(self, didLoad: data)
      } else {
        self.client?.urlProtocol(self, didFailWithError: Self.error)
      }

      self.client?.urlProtocolDidFinishLoading(self)
    }
  }

  override func stopLoading() { }
}

extension Result {
  var value: Success? { try? get() }
  var error: Failure? {
    if case let .failure(error) = self { return error }
    return nil
  }
}
