//
//  ViewController.swift
//  chyamadaKadai9
//
//  Created by toaster on 2021/08/07.
//

import UIKit

final class SourceViewController: UIViewController {
    @IBOutlet private weak var prefectureLabel: UILabel!

    @IBAction private func exit(segue: UIStoryboardSegue) { }

    @IBAction private func exitDone(segue: UIStoryboardSegue) {
        guard let prefectureSelectVC = segue.source as? PrefectureSelectViewController else { return }
        prefectureLabel.text = prefectureSelectVC.selectedPrefectureName
    }
}
