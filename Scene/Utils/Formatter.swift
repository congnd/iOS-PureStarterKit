extension Double {
  var formatted: String {
    let formatter = NumberFormatter()
    formatter.maximumFractionDigits = 3
    return formatter.string(from: NSNumber(value: self)) ?? ""
  }
}

extension Date {
  var formatted: String {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    dateFormatter.dateFormat = "yyyy/MM/dd, HH:mm:ss"

    return dateFormatter.string(from: self)
  }
}
