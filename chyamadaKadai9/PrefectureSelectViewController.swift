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

    private var prefectureButtons: [UIButton] {
        [firstPrefectureButton,
         secondPrefectureButton,
         thirdPrefectureButton,
         forthPrefectureButton]
    }

    private struct ButtonInfo {
        var button: UIButton
        var name: String
    }

    private var buttonInfos: [ButtonInfo] {
        zip(prefectureButtons, PrefectureName.all)
            .map { button, name in
                ButtonInfo(button: button, name: name)
            }
    }

    private(set) var selectedPrefectureName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonInfos
            .forEach {
                $0.button.addTarget(
                    self,
                    action: #selector(prefectureButtonDidTouched),
                    for: .touchUpInside
                )

                $0.button.setTitle($0.name, for: .normal)
            }
    }

    @objc private func prefectureButtonDidTouched(sender: UIButton) {
        guard let name = buttonInfos.first(where: { $0.button == sender })?.name else {
            return
        }

        selectedPrefectureName = name
        performSegue(withIdentifier: "exitDone", sender: nil)
    }
}
