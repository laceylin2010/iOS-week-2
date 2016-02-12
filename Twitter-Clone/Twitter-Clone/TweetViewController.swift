//
//  TweetViewController.swift
//  Twitter-Clone
//
//  Created by Lacey Vu on 2/10/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, Identity
{
    static let identity = "TweetViewController"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
   
    var tweet: Tweet?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Default to the tweet's details.
        var name = tweet?.user?.name
        var tweetText = tweet?.text
        var profileImageURL = tweet?.user?.profileImageUrl
        if let originalTweet = tweet?.originalTweet {
            // There was an original tweet, so use those details.
            name = originalTweet.user?.name
            tweetText = originalTweet.text
            profileImageURL = originalTweet.user?.profileImageUrl
        }
        
        nameLabel.text = name
        tweetLabel.text = tweetText
        
        if let profileImageURL = profileImageURL{
            if let image = SimpleCache.shared.image(profileImageURL) {
                self.imageLabel.image = image
                return
            }
        
            API.shared.GETImage(profileImageURL, completion: { (image) -> () in
                SimpleCache.shared.setImage(image, key: profileImageURL)
                self.imageLabel.image = image
                
            })
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == UserTimelineController.identity {
            
            if let userTimelineController = segue.destinationViewController as? UserTimelineController {
                userTimelineController.user = tweet?.originalTweet?.user ?? tweet?.user
            }
        }
    }
}




