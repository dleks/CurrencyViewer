//
//  UITableViewExtension.swift
//  CurrencyViewer
//
//  Created by Dmitrii Leksashov on 29/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import UIKit

extension UITableView {
    func registerNibFor(_ classToRegister: AnyClass) {
        register(UINib(nibName: String(describing: classToRegister), bundle: nil), forCellReuseIdentifier: String(describing: classToRegister))
    }
}
