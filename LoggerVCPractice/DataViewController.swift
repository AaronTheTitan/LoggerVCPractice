//
//  DataViewController.swift
//  LoggerVCPractice
//
//  Created by Aaron Bradley on 4/16/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

import UIKit

protocol DataViewControllerDelegate {

  // success
  func dataViewController(dataViewController: DataViewController, didPickDate date: NSDate, weight: Double)

  // cancel
  func dataViewControllerDidCancel(dataViewController: DataViewController)
}


class DataViewController: UIViewController {

  var delegate: DataViewControllerDelegate?

  var weight: Double? {
    didSet {
      if let weight = weight {
        weightTextField.text = "\(weight)"
      }
    }
  }

  var date: NSDate? {
    didSet {
      if let date = date {
        datePicker.date = date
      }
    }
  }



  @IBOutlet weak var weightTextField: UITextField!
  @IBOutlet weak var datePicker: UIDatePicker!


  override func viewDidLoad() {
    super.viewDidLoad()

    if let weight = weight {
      weightTextField.text = "\(weight)"
    }

    if let date = date {
      datePicker.date = date
    }

//    println("1 - In View Did Load, weight is: \(weight)")


  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
//    println("2 - In view did apper, without unwrapp, weight is: \(weight)")


  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }



  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.

    //Exit segue = must name them...but this seems a stupid way to pass data back...just conform to the delegate protocol instead
/*    if let dataViewController = segue.destinationViewController as? ViewController {
      let date = datePicker.date
      let numberFormatter = NSNumberFormatter()
      numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle

      if let weight = numberFormatter.numberFromString(weightTextField.text)?.doubleValue {
        delegate?.dataViewController(self, didPickDate: date, weight: weight)
      } else {
        delegate?.dataViewControllerDidCancel(self)
      }
    }
    */
  }


}















