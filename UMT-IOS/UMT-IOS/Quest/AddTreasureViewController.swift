//
//  AddTreasureViewController.swift
//  UMT-IOS
//
//  Created by 김우성 on 2022/03/06.
//

import UIKit

class AddTreasureViewController: UIViewController {
    
    // MARK: - Properties
    var takenPhoto: UIImage?
    var textViewPlaceHolder = "PlaceHoloder"
    
    var isFilledTags: Bool = false
    var isFilledContent: Bool = false
    
    @IBOutlet weak var treasureImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var noQuestButton: UIButton!
    @IBOutlet weak var questButton: UIButton!
    
    var buttons: [UIButton] {
        return [noQuestButton, questButton]
    }
    @IBAction func textfieldEditingChanged(_ sender: UITextField) {
        guard sender.text != nil else { return }
        if sender.text!.count > 1 {
            isFilledTags = true
        }
        updateButtonUI()
    }
}

// MARK: - View Lifecycle
extension AddTreasureViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupLayout()
    }
}

// MARK: - Actions
extension AddTreasureViewController {
    @objc
    private func didTapTextView(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
}

// MARK: - Helpers
extension AddTreasureViewController {
    
    func setupAttribute() {
        self.treasureImageView.image = takenPhoto
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
        textView.layer.cornerRadius = 8
        textView.textContainerInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        textView.font = .systemFont(ofSize: 18)
        textView.text = textViewPlaceHolder
        textView.textColor = .lightGray
        textView.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
    func setupLayout() {
        
    }
    
    func updateButtonUI() {
        if isFilledTags && isFilledContent {
            noQuestButton.setImage(UIImage(named: "noQuestColorButton"), for: .normal)
            questButton.setImage(UIImage(named: "questColorButton"), for: .normal)
        } else {
            noQuestButton.setImage(UIImage(named: "addNoQuestButton"), for: .normal)
            questButton.setImage(UIImage(named: "addQuestButton"), for: .normal)
        }
    }
}

extension AddTreasureViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
//            updateCountLabel(characterCount: 0)
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)

        let characterCount = newString.count
//        guard characterCount <= 700 else { return false }
        if characterCount > 1 {
            isFilledContent = true
        }
        updateButtonUI()
        return true
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
