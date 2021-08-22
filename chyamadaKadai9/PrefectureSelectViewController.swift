//
//  PrefectureViewController.swift
//  chyamadaKadai9
//
//  Created by toaster on 2021/08/19.
//

import UIKit

final class PrefectureSelectViewController: UIViewController {
    @IBOutlet private weak var firstPrefectureButton: UIButton!
    @IBOutlet private weak var secondPrefectureButton: UIButton!
    @IBOutlet private weak var thirdPrefectureButton: UIButton!
    @IBOutlet private weak var forthPrefectureButton: UIButton!

    private var prefectureButtonArray: [UIButton] {
        [firstPrefectureButton,
         secondPrefectureButton,
         thirdPrefectureButton,
         forthPrefectureButton]
    }

    private(set) var selectedPrefectureName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        var tagNumber = 1
        prefectureButtonArray.forEach {
            $0.addTarget(self, action: #selector(prefectureButtonDidTouched), for: .touchUpInside)
            $0.tag = tagNumber

            if let prefecture = PrefectureList.init(rawValue: $0.tag) {
                $0.setTitle(prefecture.name, for: .normal)
            } else {
                // UIButton数が列挙されているcaseより多い場合には表示しない処理
                $0.isHidden = true
            }

            tagNumber += 1
        }
    }

    @objc private func prefectureButtonDidTouched(sender: UIButton) {
        guard let selectedPrefectureButton = PrefectureList.init(rawValue: sender.tag) else { return }
        selectedPrefectureName = selectedPrefectureButton.name
        performSegue(withIdentifier: "exitDone", sender: nil)
    }
}
