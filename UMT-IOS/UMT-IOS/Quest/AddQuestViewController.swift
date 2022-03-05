//
//  AddQuestViewController.swift
//  UMT-IOS
//
//  Created by 김우성 on 2022/03/06.
//

import UIKit

class AddQuestViewController: UIViewController {
    
    // MARK: - Properties
    

    
    @IBOutlet weak var questQuestionTextField: UITextField!
    
    @IBOutlet weak var firstButon: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var fourthButton: UIButton!
    
    var buttons: [UIButton] {
        [firstButon, secondButton, thirdButton, fourthButton]
    }
    
    // MARK: - Actions
    @IBAction func ButtonDidTap(_ sender: UIButton) {
        
        
    }
    
    
}

// MARK: - View Lifecycle
extension AddQuestViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Helpers
extension AddQuestViewController {
    
    func setupLayout() {
        
    }
    
    func updateButtonUI() {
        
    }
}

