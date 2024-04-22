//
//  TblViewDelegate.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 16/04/24.
//

import Foundation
import UIKit


protocol TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath)
}
