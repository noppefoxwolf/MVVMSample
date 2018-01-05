//
//  SampleViewController.swift
//  MVVM
//
//  Created by Tomoya Hirano on 2018/01/05.
//  Copyright © 2018年 Tomoya Hirano. All rights reserved.
//

import UIKit

final class SampleViewController: UIViewController {
  @IBOutlet private weak var tableView: UITableView!
  private lazy var viewModel: SampleViewModel = .init()
  private lazy var dataSource: SampleDataSource = .init(with: self.tableView, viewModel: self.viewModel)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAppearance()
    setupUIBinding()
    setupSubscriber()
    _ = dataSource
  }
  
  private func setupAppearance() {
    tableView.refreshControl = UIRefreshControl()
  }
  
  private func setupUIBinding() {
    tableView.refreshControl?.rx.controlEvent(.valueChanged).subscribe(onNext: { [weak self] (_) in
      self?.viewModel.fetch()
    }).disposed(by: rx.disposeBag)
  }
  
  private func setupSubscriber() {
    viewModel.openDetail.drive(onNext: { (id) in
      // let vc = DetailViewController.make(with: id)
      // present(vc)
    }).disposed(by: rx.disposeBag)
    
    viewModel.reloadData.drive(onNext: { [weak self] (_) in
      self?.tableView.reloadData()
      self?.tableView.refreshControl?.endRefreshing() // 本当はviewModelにrefreshControl用のdriver生やしても良いかも
    }).disposed(by: rx.disposeBag)
  }
}
