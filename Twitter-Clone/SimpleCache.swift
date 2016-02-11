//
//  SimpleCache.swift
//  Twitter-Clone
//
//  Created by Lacey Vu on 2/11/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class SimpleCache
{
    static let shared = SimpleCache()
    private init() {}
    
    private var cache = [String : UIImage]()
    private let capactity = 20// keep 20 recent imagines
    
    func image(key: String) -> UIImage?
    {
        return self.cache[key]
    }
    
    func setImage(image: UIImage, key: String)
    {
        if self.cache.count >= self.capactity {
            guard let key = Array(self.cache.keys).last else { return }
            self.cache[key] = nil
        }
        
        //set image for key
        self.cache[key] = image
    }
}