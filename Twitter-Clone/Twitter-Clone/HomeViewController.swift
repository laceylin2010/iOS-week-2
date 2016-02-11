//
//  DetailViewController.swift
//  Twitter Clone
//
//  Created by Lacey Vu on 2/8/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource
{
    
    var twitterUser: User?
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource = [Tweet]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
     
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.update()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == ProfileViewController.identity {
            
            if let profileViewController = segue.destinationViewController as? ProfileViewController {
                profileViewController.dismiss = {
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                // Set property on profileViewController with user
                
                profileViewController.user = twitterUser
                
            }
            
        } else if segue.identifier == TweetViewController.identity {
            
            if let tweetViewController = segue.destinationViewController as? TweetViewController {
                
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let tweet = self.dataSource [indexPath.row]
                    tweetViewController.tweet = tweet
                }
                
            }
            
            
        }
    }
    
    func setupTableView()
    {
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    func update()
    {
        
        API.shared.GETTweets { (tweets) -> () in
            if let tweets = tweets {
                self.dataSource = tweets
                }
            
        API.shared.GETOAuthUser { (user) -> () in
                if let user = user {
                    self.twitterUser = user
                    
                }
            }

        }

    }
}

extension HomeViewController
{
    
    func configureCellForIndexPath(indexPath: NSIndexPath) -> UITableViewCell
    {
        let tweetCell = self.tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        let tweet = self.dataSource[indexPath.row]
        tweetCell.textLabel?.text = tweet.text
        
        
        if let user = tweet.user{
            tweetCell.detailTextLabel?.text = user.name
        }
        
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

