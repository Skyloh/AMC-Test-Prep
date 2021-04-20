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
    
    /*
    
     --static func pullRaw(site: String) -> String:
    
     Pulls the raw HTML text from the website and returns it. Mainly used for debugging since the two
     methods that used it are cringe.
    
     PRECONDITION: site is a URL.
    
    */
    static func pullRaw(site: String) -> String{
        
        let content = try! String(contentsOf: URL(string: site)!)
        
        let doc = try! SwiftSoup.parse(content)
        
        return try! doc.text()
        
    }
    
    /*
    
     --substringByStringBounds(start: String, end: String, text: String, inclusive: Bool) -> Substring:
    
     a class func that given a start string and end string and inclusivity boolean, returns the substring
     between those two start and end strings. The main reason why scrapeProblem and scrapeSolutionText are
     deprecated. Risky to call, and only used by the scrapeImageElementUrls because the precondition is
     always true.
    
     PRECONDITION: start index < end index and both strings are present in text.
    
    */
    static func substringByStringBounds(start: String, end: String, text: String, inclusive: Bool) -> Substring{
        
        let lower : String.Index = text.range(of: start)!.lowerBound
        
        let upper : String.Index = inclusive ? text.range(of: end)!.upperBound : text.range(of: end)!.lowerBound
        
        return text[lower..<upper]
        
    }
    
    /*
    
     --cleanText(site: String) -> String:
    
     mostly used for debugging, but returns text without the fluffbits at the start.
    
     PRECONDITION: site is a URL (if this is true, there won't be a nil force unwrap error ever).
    
    */
    static func cleanText(site: String) -> String{
        
        let raw = pullRaw(site: site)
        
        let start_string = "Search " + site.components(separatedBy: "index.php/").last!.replacingOccurrences(of: "_", with: " ")
        
        return raw.components(separatedBy: start_string).last!
        
    }
    
    
    /*
     --------DEPRECATED----------
     
     broke too easily due to how inconsistent the Art of Problem Solving website is with its formatting
     Couldn't figure out how to deal with optionals in the Substring methods, and furthermore, how these errors
     would be dealt with during runtime.
     
     Use .scrapeByComponents(site: String) instead, much cleaner and adaptable, if not taking a few
     preconditions into account.
     
     Also it's kinda really ugly.
     
     --------DEPRECATED----------
    
    //a class function that returns the text related to the problem
    static func scrapeProblemText(site: String) -> String{
        
        let raw_new = cleanText(site: site)
        
        if (raw_new.contains("Contents ") && (raw_new.contains("See Also") || raw_new.contains("Video Solution"))){
            
            let end = raw_new.contains("Video Solution") ? "Video Solution"  : "See Also"
            
            let cut = (raw_new.components(separatedBy: substringByStringBounds(start: "Contents ", end: end, text: String(raw_new), inclusive: true))).joined()
            
            return String(substringByStringBounds(start: "Problem ", end: "Solution", text: cut, inclusive: false))
            
        }
        
        return String(substringByStringBounds(start: "Problem ", end: "Solution", text: raw_new, inclusive: false))
        
    }
     
    
    //a class function that returns the text related to the solution
    static func scrapeSolutionText(site: String) -> String{
        
        let raw_new = cleanText(site: site)
        
        if (raw_new.contains("Contents ") && (raw_new.contains("See Also") || raw_new.contains("Video Solution"))){
            
            let cutting_end = raw_new.contains("Video Solution") ? "Video Solution"  : "See Also"
            
            let cut = (raw_new.components(separatedBy: substringByStringBounds(start: "Contents ", end: cutting_end, text: String(raw_new), inclusive: true))).joined()
            
             return String(substringByStringBounds(start: "Solution ", end: cutting_end, text: cut, inclusive: false))
            
        }
        
        return String(substringByStringBounds(start: "Solution ", end: (raw_new.contains("Video Solution") ? "Video Solution"  : "See Also"), text: raw_new, inclusive: false))
    }
     */
    
    /*
     
     --scrapeByComponents(site: String) -> [String]:
     
     much cleaner, simpler, and generalized for of scraping.
     
     PRECONDITION: site is a URL, any unwanted strings are below 60 characters in length, the user
     only intends to use the problem text, and the FIRST solution text.
     
    */
    static func scrapeByComponents(site: String) -> [String] {
        
        let text = cleanText(site: site)
        
        var split : [String] = text.components(separatedBy: "Solution")
        
        split = split.filter { (entry) -> Bool in
            entry.count > 60
        }
        
        split = split.map{
            $0.contains("See Also") ? $0.replacingOccurrences(of: "See Also", with: "") : $0
        }
        
        split[1] = split[1].components(separatedBy: "AMC 8")[0]
        
        return split
        
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

