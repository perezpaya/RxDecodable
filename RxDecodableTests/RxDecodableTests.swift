//
//  RxDecodableTests.swift
//  RxDecodableTests
//
//  Created by Alejandro Perezpayá on 1/18/16.
//  Copyright © 2016 ermes. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxBlocking
import Decodable

@testable import RxDecodable

struct TestDecodable: RxDecodable {
    let foo: String

    static func decode(bar: AnyObject) -> TestDecodable {
        return TestDecodable(foo: bar as! String)
    }
}

class RxDecodableTests: XCTestCase {
    let disposableBag = DisposeBag()
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDecodesOne() {
        TestDecodable.rx_decode("bar").subscribe { o in
            XCTAssertEqual(o.element!.foo, "bar")
        }.addDisposableTo(disposableBag)
    }

    func testDecodesMultiple() {
        [TestDecodable].rx_decode(["bar", "barbar"]).subscribe { o in
            XCTAssertEqual(o.element!.first!.foo, "bar")
            XCTAssertEqual(o.element!.last!.foo, "barbar")
        }.addDisposableTo(disposableBag)
    }
}
