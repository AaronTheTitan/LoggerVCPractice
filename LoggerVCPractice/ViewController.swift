//
//  ViewController.swift
//  LoggerVCPractice
//
//  Created by Aaron Bradley on 4/16/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
      dataViewController.weight = 250
      dataViewController.date = NSDate(timeIntervalSinceNow: -60 * 60 * 24 * 3)
    }
  }


}

