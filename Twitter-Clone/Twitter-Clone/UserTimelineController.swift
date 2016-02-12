//
//  UserTimelineController.swift
//  Twitter-Clone
//
//  Created by Lacey Vu on 2/11/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class UserTimelineController: UIViewController, UITableViewDataSource, Identity
{

    @IBOutlet weak var tableView: UITableView!
    static let identity = "UserTimelineController"
    var user: User?
    
    
    var dataSource = [Tweet]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = self.user {
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

    
    func setupTableView()
    {
        self.tableView.registerNib(UINib(nibName: "TweetCell", bundle: nil), forCellReuseIdentifier: "TweetCell")
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.dataSource = self
        
        if let screenName = user?.screenName {
            
            API.shared.GETUserTweets(screenName) { (tweets) -> () in
                self.dataSource = tweets ?? []
            }
        }
        
    }
    
    func configureCellForIndexPath(indexPath: NSIndexPath) -> UITableViewCell
    {
        let tweetCell = self.tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath:indexPath) as! TweetCell
        tweetCell.tweet = self.dataSource[indexPath.row]
        
        
        return tweetCell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        return self.configureCellForIndexPath(indexPath)
    }
    
}

