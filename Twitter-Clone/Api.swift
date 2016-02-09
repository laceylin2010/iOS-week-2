//
//  Api.swift
//  Twitter-Clone
//
//  Created by Lacey Vu on 2/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import Foundation
import Accounts
import Social

class API
{
    static let shared = API()
    private init() {}
    
    func login(completion: (account: ACAccount?) -> ())
    {
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { ( granted, error) -> Void in
            if let _ = error {
                print("ERROR: Request access to accounts return an error")
                
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                completion(account: nil)
                })
            }
            
            if granted {
                if let account = accountStore.accountsWithAccountType(accountType).first as? ACAccount{
                    NSOperationQueue.mainQueue().addOperationWithBlock { completion(account: account) }
                    return
                }
                
                print("ERROR: No twitter accounts were found on this device")
                NSOperationQueue.mainQueue().addOperationWithBlock { completion(account: nil) }
                 return
            }
            
            print("ERROR: This app requires access to Twitter Accounts.")
            NSOperationQueue.mainQueue().addOperationWithBlock { completion(account: nil) }
            return
            
        }
    }
    
}