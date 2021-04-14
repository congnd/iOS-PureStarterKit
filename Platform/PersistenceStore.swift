@propertyWrapper
struct PersistenceStore<T: Codable> {
  enum Key: String {
    case lastUpdate
  }

  struct ExpirableData: Codable {
    let date: Date
    let data: T
  }

  let duration: TimeInterval?

  let key: Key

  /// Initializer
  /// - Parameters:
  ///   - duration: The expire duration in seconds. Pass `nil` if you want the data lasts forever.
  ///   - key: The key used to persist the data.
  init(duration: TimeInterval? = AppConfig.cacheDuration, key: Key) {
    self.duration = duration
    self.key = key
  }

  var wrappedValue: T? {
    get {
      guard let jsonData = UserDefaults.standard.data(forKey: key.rawValue),
            let expirableData = try? JSONDecoder().decode(ExpirableData.self, from: jsonData)
      else { return nil }

      if
        let duration = duration,
        Date().timeIntervalSince(expirableData.date) > duration
      { return nil }

      return expirableData.data
    }

    set {
      guard let newValue = newValue else {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        return
      }

      let expirableData = ExpirableData(date: Date(), data: newValue)
      guard let jsonData = try? JSONEncoder().encode(expirableData) else { return }
      UserDefaults.standard.set(jsonData, forKey: key.rawValue)
    }
  }
}
