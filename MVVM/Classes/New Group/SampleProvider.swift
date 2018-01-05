//
//  SampleProvider.swift
//  MVVM
//
//  Created by Tomoya Hirano on 2018/01/05.
//  Copyright © 2018年 Tomoya Hirano. All rights reserved.
//

import UIKit
import RxSwift

final class SampleProvider: NSObject {
  var response: Observable<[Sample]> { return _response.asObservable() }
  private let _response = PublishSubject<[Sample]>()
  
  func fetch() {
    _response.onNext([Sample(id: 12, message: "hello mvvm")])
  }
}
