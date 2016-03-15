//
//  GuiderContentViewController.swift
//  FoodPin
//
//  Created by xiaobo on 15/11/12.
//  Copyright © 2015年 xiaobo. All rights reserved.
//

import UIKit

class GuiderContentViewController: UIViewController {

    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var labelHeading: UILabel!
    @IBOutlet weak var labelFooter: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var doneBtn: UIButton!
    @IBAction func doneBtnTapped(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "guiderShowed")
        
        //如果设备具备3D Touch功能，则添加快速操作
        if traitCollection.forceTouchCapability == .Available {
            let bundleID = NSBundle.mainBundle().bundleIdentifier
            
            let item1icon = UIApplicationShortcutIcon(templateImageName: "favorite")
            let item1 = UIApplicationShortcutItem(type: "\(bundleID).openFav", localizedTitle: "最爱", localizedSubtitle: nil, icon:  item1icon, userInfo: nil)
            
            let item2icon = UIApplicationShortcutIcon(templateImageName: "discover")
            let item2 = UIApplicationShortcutItem(type: "\(bundleID).openDiscover", localizedTitle: "发现", localizedSubtitle: nil, icon:  item2icon, userInfo: nil)
            
            let item3icon = UIApplicationShortcutIcon(type: .Add)
            let item3 = UIApplicationShortcutItem(type: "\(bundleID).openAddNew", localizedTitle: "新店", localizedSubtitle: nil, icon: item3icon, userInfo: nil)
            
            UIApplication.sharedApplication().shortcutItems = [item1, item2, item3]
        }
    }
    var index = 0
    var heading = ""
    var footer = ""
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelHeading.text = heading
        labelFooter.text = footer
        imageView.image = UIImage(named: imageName)
        
        pageCtrl.currentPage = index
        
        //当是第三个引导页时，按钮才显示
        if index == 2 {
            doneBtn.setTitle("马上体验", forState: .Normal)
            doneBtn.hidden = false
        } else {
            doneBtn.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
