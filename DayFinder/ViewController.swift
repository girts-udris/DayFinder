//
//  ViewController.swift
//  DayFinder
//
//  Created by girts.udris on 01/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var DayTextField: UITextField!
    
    @IBOutlet weak var monthTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var findButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController first lunch")
    }

    @IBAction func FindWeekdayTapped(_ sender: Any) {
        var day: String {
            return DayTextField.text ?? ""
        }
        var month: String {
            return monthTextField.text ?? ""
        }
        var year: String {
            return yearTextField.text ?? ""
        }
        
        func getDayOfWeek(_ today:String) -> Int? {
            let formatter  = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            guard let todayDate = formatter.date(from: today) else { return nil }
            let myCalendar = Calendar(identifier: .gregorian)
            let weekDay = myCalendar.component(.weekday, from: todayDate)
            return weekDay
        }
        if let weekday = getDayOfWeek("\(year)-\(month)-\(day)") {
            switch weekday {
            case 1:
                resultLabel.text = "Today is : Sunday"
            case 2:
                resultLabel.text = "Today is : Monday"
            case 3:
                resultLabel.text = "Today is : Tuesday"
            case 4:
                resultLabel.text = "Today is : Wednesday"
            case 5:
                resultLabel.text = "Today is : Thursday"
            case 6:
                resultLabel.text = "Today is : Friday"
            case 7:
                resultLabel.text = "Today is : Saturtday"
            default:
                resultLabel.text = "Please insert correct date"
            }
        } else {
            resultLabel.text = "Please insert correct date"
        }
        
        
    }
    
}

