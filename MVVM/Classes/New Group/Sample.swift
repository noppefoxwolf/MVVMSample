//
//  Sample.swift
//  MVVM
//
//  Created by Tomoya Hirano on 2018/01/05.
//  Copyright © 2018年 Tomoya Hirano. All rights reserved.
//

import UIKit

final class Sample: NSObject {
  let id: Int
  let message: String
  
  init(id: Int, message: String) {
    self.id = id
    self.message = message
    super.init()
  }
}
