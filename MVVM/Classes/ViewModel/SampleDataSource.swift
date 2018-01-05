//
//  SampleDataSource.swift
//  MVVM
//
//  Created by Tomoya Hirano on 2018/01/05.
//  Copyright © 2018年 Tomoya Hirano. All rights reserved.
//

import UIKit

final class SampleDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
  private let viewModel: SampleViewModel
  
  init(with tableView: UITableView, viewModel: SampleViewModel) {
    self.viewModel = viewModel
    super.init()
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.samples.value.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
    let sample = viewModel.samples.value[indexPath.row]
    cell.textLabel?.text = sample.message
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.tap(indexPath)
  }
}
