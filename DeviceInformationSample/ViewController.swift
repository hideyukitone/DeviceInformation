//
//  ViewController.swift
//  DeviceInformationSample
//
//  Created by hideyukitone on 2016/03/21.
//  Copyright © 2016年 hideyukitone. All rights reserved.
//

import UIKit
import DeviceInformation

class ViewController: UIViewController {

    @IBOutlet weak var lblDeviceModelName: UILabel!
    @IBOutlet weak var lbliOSVer: UILabel!
    @IBOutlet weak var imgModel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblDeviceModelName.text = DeviceInformation.modelName
        lbliOSVer.text = DeviceInformation.systemName + " " + DeviceInformation.iOSVersion
        
        if DeviceInformation.isiPhone {
            imgModel.image = #imageLiteral(resourceName: "iPhone")
        } else if DeviceInformation.isiPad {
            imgModel.image = #imageLiteral(resourceName: "iPad")
        } else if DeviceInformation.isiPodtouch {
            imgModel.image = #imageLiteral(resourceName: "iPod touch")
        } else if DeviceInformation.isSimulator {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

