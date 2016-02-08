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
    @IBOutlet weak var tableView: UITableView!
    var dataSource = [Tweet]() {
        didSet {
            //
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        
        JSONParser.tweetJSONFrom(JSONParser.JSONData()) { (success, tweets) -> () in
            
        
        }
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func setupTableView()
    {
        self.tableView.dataSource = self
    }
    
    func update()
    {
        JSONParser.tweetJSONFrom(JSONParser.JSONData()) { (success, tweets) -> () in
            if success  {
                if let tweets = tweets {
                    self.dataSource = tweets
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

