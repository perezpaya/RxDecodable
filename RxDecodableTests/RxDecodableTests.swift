import RxSwift
import RxCocoa
import Decodable

import Quick
import Nimble

@testable import RxDecodable

struct TestDecodable: RxDecodable {
    let foo: String

    static func decode(bar: AnyObject) -> TestDecodable {
        return TestDecodable(foo: bar as! String)
    }
}

class RxDecodableSpec: QuickSpec {
    let disposableBag = DisposeBag()
    override func spec() {
        describe("RxDecodable") {
            it("decodes one item in a decodable object") {
                TestDecodable.rx_decode("bar").subscribe { o in
                    expect(o.element?.foo).to(equal("bar"))
                }.addDisposableTo(self.disposableBag)
            }
            
            it("decodes multiple items in a array of decodable objects") {
                [TestDecodable].rx_decode(["bar", "man"]).subscribe { o in
                    expect(o.element?.first?.foo).to(equal("bar"))
                    expect(o.element?.last?.foo).to(equal("man"))
                }.addDisposableTo(self.disposableBag)
            }
        }
    }
}
