//
//  ViewController.swift
//  LoggerVCPractice
//
//  Created by Aaron Bradley on 4/16/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataViewControllerDelegate {


  @IBOutlet weak var textView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // IBAction + segue as only parameter - to unwind back to this VC
  @IBAction func unwindToViewController(segue: UIStoryboardSegue) {

  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //if segue.identifier == "DataViewController" //one approach

    if let dataViewController = segue.destinationViewController as? DataViewController {
      dataViewController.view.backgroundColor = UIColor.orangeColor()
      dataViewController.delegate = self
      dataViewController.weight = 250
      dataViewController.date = NSDate(timeIntervalSinceNow: -60 * 60 * 24 * 3)
    }
  }


  // Delegate methods for DataViewControllerDelegate
  func dataViewController(dataViewController: DataViewController, didPickDate date: NSDate, weight: Double) {
    println("ViewController.dataViewController didPickDate")

    var massFormatter = NSMassFormatter()
    let weightString = massFormatter.stringFromValue(weight, unit: NSMassFormatterUnit.Pound)

    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle

    let dateString = dateFormatter.stringFromDate(date)

    textView.text! += "\(dateString) weight: \(weightString)\n"

  }

  func dataViewControllerDidCancel(dataViewController: DataViewController) {
    println("ViewController.dataViewController didCancel")
  }



}

