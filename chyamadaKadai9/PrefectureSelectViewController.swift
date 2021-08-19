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

    override func viewDidLoad() {
        super.viewDidLoad()

        var tagNumber = 1
        prefectureButtonArray.forEach {
            $0.addTarget(self, action: #selector(prefectureButtonDidTouched), for: .touchUpInside)
            $0.tag = tagNumber

            if let prefecture = PrefectureList.init(rawValue: $0.tag) {
                $0.setTitle(prefecture.name, for: .normal)
            } else {
                $0.isHidden = true
            }

            tagNumber += 1
        }
    }

    @objc private func prefectureButtonDidTouched(sender: UIButton) {
        guard let viewController = presentingViewController as? ViewController else { return }
        if let prefecture = PrefectureList.init(rawValue: sender.tag) {
            viewController.setLabelText(prefectureName: prefecture.name)
        }
        performSegue(withIdentifier: "toFirst", sender: self)
    }
}
