//
//  ProfileViewController.swift
//  Twitter-Clone
//
//  Created by Lacey Vu on 2/10/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

typealias ProfileViewControllerDismissal = () -> ()


class ProfileViewController: UIViewController, Identity {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    static let identity = "ProfileViewController"
    var dismiss: ProfileViewControllerDismissal?
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = user?.name
        locationLabel.text = user?.location
        
    }
    
    @IBAction func closeButtonClicked(sender: UIButton) {
        dismiss?()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
