//
//  TweetViewController.swift
//  Twitter-Clone
//
//  Created by Lacey Vu on 2/10/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, Identity {
    static let identity = "TweetViewController"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    
    var tweet: Tweet?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Default to the tweet's details.
        var name = tweet?.user?.name
        var tweetText = tweet?.text
        if let originalTweet = tweet?.originalTweet {
            // There was an original tweet, so use those details.
            name = originalTweet.user?.name
            tweetText = originalTweet.text
        }
        
        nameLabel.text = name
        tweetLabel.text = tweetText
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
