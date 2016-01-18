import Foundation
import RxSwift
import Decodable

public typealias RxDecodable = Decodable
public extension RxDecodable {
    public static func rx_decode(json: AnyObject) -> Observable<Self> {
        return Observable.create { o in
            do {
                try o.onNext(self.decode(json))
            } catch let e {
                o.onError(e)
            }
            return AnonymousDisposable {}
        }
    }
}

public extension Array where Element: RxDecodable {
    public static func rx_decode(json: AnyObject) -> Observable<[Element]> {
        return Observable.create { o in
            do {
                try o.onNext([Element].decode(json))
            } catch let e {
                o.onError(e)
            }
            return AnonymousDisposable {}
        }
    }
}
