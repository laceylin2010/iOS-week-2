//
//  UserTimelineController.swift
//  Twitter-Clone
//
//  Created by Lacey Vu on 2/11/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class UserTimelineController: UIViewController
{

    var tweet: Tweet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = self.tweet?.user {
            API.shared.GETUserTweets(user.screenName, completion: { (tweets) -> () in
                if let tweets = tweets {
                    for tweet in tweets {
                        print(tweet.text)
                    }
                }
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

