//
//  ViewController.swift
//  chyamadaKadai9
//
//  Created by toaster on 2021/08/07.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var prefectureLabel: UILabel!

    @IBAction private func exit(segue: UIStoryboardSegue) {
    }

    func setLabelText(prefectureName: String) {
        prefectureLabel.text = prefectureName
    }
}
