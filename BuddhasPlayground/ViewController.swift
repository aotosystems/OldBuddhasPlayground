//
//  ViewController.swift
//  BuddhasPlayground
//
//  Created by Jon Kurisu on 7/12/15.
//  Copyright © 2015 AOTO Systems, Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      let testObject = PFObject(className: "TestObject")
      testObject.setObject("BAR", forKey: "Foo")
      testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
        if success {
          print("TestObject created with ID: \(testObject.objectId)")
          let query = PFQuery(className: "TestObject")
          query.getObjectInBackgroundWithId(testObject.objectId!) { (test: PFObject?, error: NSError?) -> Void in
            if error == nil {
              let value = testObject.objectForKey("Foo")
              print("TestObject \(value)")
            } else {
              print(error)
            }
          }
        } else {
          print(error)
        }
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

