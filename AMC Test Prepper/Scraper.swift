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
    
    //a class function that returns the text related to the problem
    static func scrapeProblemText(site: String) -> String{
        
        //get the html text
        let raw = self.pullRaw(site: site)
        
        //cuts away the first 1300 characters because they are never relevant to the problem
        let cleaved_text = raw[Range(NSRange(location: 1300, length: 1000), in: raw)!]
        
        //cuts away the "Contents" menu from the top
        if (cleaved_text.contains("Contents ")){
            
            //basically cuts out the section of text with the "contents" tab
            let cut_text = (cleaved_text.components(separatedBy: substringByStringBounds(start: "Contents ", end: "See Also", text: String(cleaved_text), inclusive: true))).joined()
            
            //return the desired substring between the two bounds from the newer cut text
            return String(substringByStringBounds(start: "Problem ", end: "Solution", text: cut_text, inclusive: false))
            
        }
        
        //return the desired substring between the bounds
        return String(substringByStringBounds(start: "Problem ", end: "Solution", text: String(cleaved_text), inclusive: false))
    }
    
    //same fundamental idea as scrapeProblemText but with different string bounds
    static func scrapeSolutionText(site: String) -> String{
        
        let raw = pullRaw(site: site)
        
        let cleaved_text = raw[Range(NSRange(location: 1300, length: 1000), in: raw)!]
        
        if (cleaved_text.contains("Contents ")){
            
            let cut_text = (cleaved_text.components(separatedBy: substringByStringBounds(start: "Contents ", end: "See Also", text: String(cleaved_text), inclusive: true))).joined()
            
            return String(substringByStringBounds(start: "Solution ", end: "See Also", text: cut_text, inclusive: false))
            
        }
        
        return String(substringByStringBounds(start: "Solution ", end: "See Also", text: String(cleaved_text), inclusive: false))
        
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

