import RxSwift
import RxCocoa
import Decodable

import Quick
import Nimble

@testable import RxDecodable

struct God: RxDecodable {
    let name: String
    let parents: [God]

    static func decode(j: AnyObject) throws -> God {
        return try God(name: j => "name", parents: j => "parents")
    }
}


class RxDecodableSpec: QuickSpec {
    let disposableBag = DisposeBag()
    let hermesDictionary = [
        "name": "Hermes",
        "parents": [
            ["name": "Zeus", "parents": []],
            ["name": "Maia", "parents": []]
        ]
    ]

    let zeusDictionary = [
        "name": "Zeus",
        "parents": []
    ]

    override func spec() {
        describe("RxDecodable") {
            it("decodes one item in a decodable object") {
                God.rx_decode(self.hermesDictionary).subscribe { o in
                    expect(o.element?.name).to(equal("Hermes"))
                }.addDisposableTo(self.disposableBag)
            }
            
            it("decodes multiple items in a array of decodable objects") {
                let a = [God].rx_decode([self.hermesDictionary, self.zeusDictionary])
                a.subscribeError { e in
                    print(e)
                }.addDisposableTo(self.disposableBag)
                a.subscribe { o in
                    expect(o.element?.first?.name).to(equal("Hermes"))
                    expect(o.element?.last?.name).to(equal("Zeus"))
                }.addDisposableTo(self.disposableBag)
            }
            
            it("decodes embedded array") {
                God.rx_decode(self.hermesDictionary).subscribe { o in
                    expect(o.element?.name).to(equal("Hermes"))
                    expect(o.element?.parents.first?.name).to(equal("Zeus"))
                    expect(o.element?.parents.last?.name).to(equal("Maia"))
                }.addDisposableTo(self.disposableBag)
            }
        }
    }
}
