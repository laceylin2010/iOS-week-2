//
//  DetailViewController.swift
//  Twitter Clone
//
//  Created by Lacey Vu on 2/8/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
    var datasource = [Tweet]() {
        didSet {
            //
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JSONParser.tweetJSONFrom(JSONParser.JSONData()) { (success, tweets) -> () in
            
        
        }
    }
    
    override func viewwWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func update()
    {
        JSONParser.tweetJSONFrom(JSONParser.JSONData()) { (sucess, tweets) -> () in
            if success  {
                if let tweets = tweets {
                    self.datasource = tweets
                }
            }
            
        }
    }

}

