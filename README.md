# RxDecodable
[![Build Status](https://travis-ci.org/ermesup/RxDecodable.svg?branch=master)](https://travis-ci.org/ermesup/RxDecodable)

# Usage
```swift
struct God: RxDecodable {
    let name: String
    let parents: [God]?

    static func decode(j: AnyObject) throws -> God {
        return try God(name: j => "name", parents: j => "parents")
    }
}

let hermes = God.rx_decode(["name": "Hermes",
                            "parents": [["name": "Zeus"],["name": "Maia"]]])

hermes.subscribeError { e in
    print(e)
}.addDisposableTo(self.disposableBag)

hermes.subscribe { g in
    print(g.element?.name) // Hermes
    print(g.element?.parents?.first?.name) // Zeus
    print(g.element?.parents?.last?.name) // Maia
}.addDisposableTo(self.disposableBag)

```

# Installation

## Cocoapods
```bash
pod 'RxDecodable', '~> 0.1'
```
