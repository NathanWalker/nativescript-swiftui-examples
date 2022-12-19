import SwiftUI

@objc
class CardProvider: UIViewController, SwiftUIProvider {

  // MARK: INIT

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  required public init() {
    super.init(nibName: nil, bundle: nil)
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    setupSwiftUIView(content: swiftUIView)
    registerObservers()
  }

  // MARK: PRIVATE

  private var swiftUIView = Card()

  private func registerObservers() {
      swiftUIView.data.toggle = { (showing: Bool) in
          // notify NativeScript
          self.onEvent?(["showing": showing])
      }
  }

  /// Receive data from NativeScript
  func updateData(data: NSDictionary) {
      data.forEach { (k,v) in swiftUIView.data.props[k] = v }
  }

  /// Allow sending of data to NativeScript
  var onEvent: ((NSDictionary) -> ())?
}
