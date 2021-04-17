//
//  Question.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 4/9/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//


//archived problematic problems
//https://artofproblemsolving.com/wiki/index.php/2015_AMC_8_Problems/Problem_14
//https://artofproblemsolving.com/wiki/index.php/2012_AMC_8_Problems/Problem_16
//https://artofproblemsolving.com/wiki/index.php/2016_AMC_8_Problems/Problem_24
//https://artofproblemsolving.com/wiki/index.php/2016_AMC_8_Problems/Problem_4
//https://artofproblemsolving.com/wiki/index.php/2015_AMC_8_Problems/Problem_5


import Foundation
import SwiftUI

//when making a Question, CACHE IT
//these methods are taxing to call
//or just use lazy views lol
class Question{
    
    var problemText : String
    var solutionText : String
    var imageURLs : [String]
    var tags : [String]
    
    init(site: String)  {
        
        let list = Scraper.scrapeByComponents(site: site)
        
        problemText = list[0]
        solutionText = list[1]
        
        imageURLs = Scraper.scrapeImageElementUrls(site: site)
        
        tags = [""]
        
    }
    
    convenience init() {
        
        let random_string : String = "https://artofproblemsolving.com/wiki/index.php/20" + String(Int.random(in: 10..<18)) + "_AMC_8_Problems/Problem_" + String(Int.random(in: 1..<26))
        
        print("Now loading: " + random_string)
        
        self.init(site: random_string)
        
    }
    
    //returns an image from the specified index
    func loadFromIndex(index: Int) -> Image{
        
        if let data = try? Data(contentsOf: URL(string: imageURLs[index])!){
            return Image(uiImage: UIImage(data: data)!)
        }
        
        return Image("")
    }
    
    func addTag(tag: String){
        
        if !tags.contains(tag) {
            tags.append(tag)
        }
        
    }
    
    //WIP
    func formatTextWithImages() {
        print(self.problemText)
    }
    
    
}
