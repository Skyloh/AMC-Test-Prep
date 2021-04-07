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
    
    //a class function that pulls the raw HTML text from the website and returns it
    static func pullRaw(site: String) -> String{
        
        let content = try! String(contentsOf: URL(string: site)!)

        let doc = try! SwiftSoup.parse(content)
        
        return try! doc.text()
        
    }
    
    //a class function that returns the text related to the problem
    static func scrapeProblemText(site: String) -> String{
        
        //get the html text
        let raw = self.pullRaw(site: site)
        
        //cuts away the first 1300 characters because they are never relevant to the problem
        let cleaved_text = raw[Range(NSRange(location: 1300, length: 1000), in: raw)!]
        
        //returns the range of characters that contains the problem to the solution
        let problem_text_range = (cleaved_text.range(of: "Problem ")!.lowerBound) ..< (cleaved_text.range(of: "Solution")!.lowerBound)
        
        //tfw substring =/= string
        return String(cleaved_text[problem_text_range])
    }
    
    //same fundamental idea as scrapeProblemText
    static func scrapeSolutionText(site: String) -> String{
        
        let raw = pullRaw(site: site)
        
        let cleaved_text = raw[Range(NSRange(location: 1300, length: 1000), in: raw)!]
        
        let solution_text_range = (cleaved_text.range(of: "Solution ")!.lowerBound) ..< (cleaved_text.range(of: "See Also")!.lowerBound)
        
        return String(cleaved_text[solution_text_range])
        
    }
    
    static func scrapeImageElementUrls(site: String) -> [String]{
        return [String]()
    }
}

