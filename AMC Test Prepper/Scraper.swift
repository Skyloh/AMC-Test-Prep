//
//  Scraper.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 4/6/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import Foundation
import SwiftSoup

struct Scraper{
    
    //get the problems relevant text for the problem ~~DONE
    
    //get the problems relevant text for the solution
    //get the image urls
        //let pngs: Elements = try! doc.select("img[src$=.png]")
    
    static func execute(site: String) {
        
        let content = try! String(contentsOf: URL(string: site)!)

        let doc = try! SwiftSoup.parse(content)
        
        let raw = try! doc.text()
        
        let cleaved_text = raw[Range(NSRange(location: 1300, length: 1000), in: raw)!]
        
        let problem_text_range = (cleaved_text.range(of: "Problem ")!.lowerBound) ..< (cleaved_text.range(of: "Solution")!.lowerBound)
        
        print(cleaved_text[problem_text_range])
    }
}

