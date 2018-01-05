//
//  SampleViewModel.swift
//  MVVM
//
//  Created by Tomoya Hirano on 2018/01/05.
//  Copyright © 2018年 Tomoya Hirano. All rights reserved.
//

import UIKit
import NFRxSwiftExt
import RxSwift
import RxCocoa
import NSObject_Rx

final class SampleViewModel: NSObject {
  private let provider = SampleProvider()
  let samples: Property<[Sample]>
  private let _samples = Variable<[Sample]>([])
  let reloadData: Driver<Void>
  private let _reloadData = PublishSubject<Void>()
  let openDetail: Driver<Int>
  private let _openDetail = PublishSubject<Int?>()
  
  override init() {
    samples = Property(_samples)
    reloadData = _reloadData.asDriver()
    openDetail = _openDetail.asDriver()
    super.init()
    setupSubscriber()
  }
  
  private func setupSubscriber() {
    provider.response.bind(to: _samples).disposed(by: rx.disposeBag)
    samples.asObservable().map(void).bind(to: _reloadData).disposed(by: rx.disposeBag)
  }
  
  func fetch() {
    provider.fetch()
  }
  
  func tap(_ indexPath: IndexPath) {
    let sample = samples.value[indexPath.row]
    _openDetail.onNext(sample.id)
  }
}
