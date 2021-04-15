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
    
    //a class function that pulls the raw HTML text from the website and returns it
    //PRECONDITION: String input is a URL
    static func pullRaw(site: String) -> String{
        
        let content = try! String(contentsOf: URL(string: site)!)
        
        let doc = try! SwiftSoup.parse(content)
        
        return try! doc.text()
        
    }
    
    //a class func that given a start string and end string and inclusivity boolean, returns the substring
    //between those two start and end strings.
    //PRECONDITION: start index < end index and both strings are present in text
    static func substringByStringBounds(start: String, end: String, text: String, inclusive: Bool) -> Substring{
        
        let lower : String.Index = text.range(of: start)!.lowerBound
        
        let upper : String.Index = inclusive ? text.range(of: end)!.upperBound : text.range(of: end)!.lowerBound
        
        return text[lower..<upper]
        
    }
    
    //a class function that given a URL, cleans the html down to relevant text
    static func cleanText(site: String) -> String{
        
        let raw = pullRaw(site: site)
        
        let start_string = "Search " + site.components(separatedBy: "index.php/").last!.replacingOccurrences(of: "_", with: " ")
        
        return raw.components(separatedBy: start_string).last!
        
    }
    
    //a class function that returns the text related to the problem
    static func scrapeProblemText(site: String) -> String{
        
        var raw_new = cleanText(site: site)
        
        if (raw_new.contains("Contents ")){
            
            raw_new = (raw_new.components(separatedBy: substringByStringBounds(start: "Contents ", end: "See Also", text: String(raw_new), inclusive: true))).joined()
            
        }
        
        return String(substringByStringBounds(start: "Problem ", end: "Solution", text: raw_new, inclusive: false))
        
    }
    
    //a class function that returns the text related to the solution
    static func scrapeSolutionText(site: String) -> String{
        
        var raw_new = cleanText(site: site)
        
        if (raw_new.contains("Contents ")){
            
            raw_new = (raw_new.components(separatedBy: substringByStringBounds(start: "Contents ", end: "See Also", text: String(raw_new), inclusive: true))).joined()
            
        }
        
        return String(substringByStringBounds(start: "Solution ", end: "See Also", text: raw_new, inclusive: false))
    }
    
    //gets the image urls from the html
    //PRECONDITION: site is an url
    static func scrapeImageElementUrls(site: String) -> [String]{
        
        //gets all the Nodes with .png endings
        let content = try! String(contentsOf: URL(string: site)!)
        
        var elements = try! (SwiftSoup.parse(content).select("img[src$=.png]")).array()
        
        //removes the last two entries because they are logos and we dont need those
        elements.removeLast()
        elements.removeLast()
        
        //turns every string into a usuable https: link
        return elements.map {
            String("https:" + substringByStringBounds(start: "//", end: ".png", text: $0.description, inclusive: true))
        }
        
    }
}

