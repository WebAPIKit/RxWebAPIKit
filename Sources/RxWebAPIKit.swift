/**
 *  RXWebAPIKit
 *
 *  Copyright (c) 2017 Evan Liu. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

import WebAPIKit
import Result
import RxSwift

extension WebAPIRequest {

    public func rx_send(by httpClient: HTTPClient? = nil) -> Observable<WebAPIResponse> {
        return RxCreator(httpClient: httpClient, send: send).create()
    }

    public func rx_sendAndDecode<T: ResponseData>(by httpClient: HTTPClient? = nil) -> Observable<T> {
        return RxCreator(httpClient: httpClient, send: sendAndDecode).create()
    }

    public func rx_sendAndDecodeList<T: ResponseData>(by httpClient: HTTPClient? = nil) -> Observable<[T]> {
        return RxCreator(httpClient: httpClient, send: sendAndDecodeList).create()
    }
    
}

private struct RxCreator<T> {
    typealias Handler = (Result<T, WebAPIError>) -> Void
    typealias Send = (HTTPClient?, @escaping Handler) -> WebAPIKit.Cancelable

    let httpClient: HTTPClient?
    let send: Send

    func create() -> Observable<T> {
        return Observable.create { observer in
            let cancelable = self.send(self.httpClient) {
                switch $0 {
                case .success(let data):
                    observer.onNext(data)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create(with: cancelable.cancel)
        }
    }
}
