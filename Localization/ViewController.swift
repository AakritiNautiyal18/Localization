//
//  ViewController.swift
//  Localization
//
//  Created by Daffolap-mac-114 on 25/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var languageSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messagePicker: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLanguage(lang: "en")
    }
    
    func changeLanguage(lang: String) {
        titleLabel.text = "title".localizeString(string: lang)
        messagePicker.text = "info".localizeString(string: lang)
    }
    
    
    @IBAction func languageSelected(_ sender: Any) {
        switch languageSegmentedControl.selectedSegmentIndex {
        case 0:
            changeLanguage(lang: "en")
            break
            
        case 1:
            changeLanguage(lang: "fr")
            break
            
        case 2:
            changeLanguage(lang: "de")
            break
            
        default:
            changeLanguage(lang: "hi")
            break
        }
    }
}

extension String {
    func localizeString(string: String) -> String {
        let path = Bundle.main.path(forResource: string, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
