//
//  Question.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 4/9/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import Foundation
import SwiftUI

//when making a Question, CACHE IT
//these methods are taxing to call
class Question{
    
    var problemText : String
    var solutionText : String
    var imageURLs : [String]
    var tags : [String]
    
    init(site: String){
        
        problemText = Scraper.scrapeProblemText(site: site)
        solutionText = Scraper.scrapeSolutionText(site: site)
        imageURLs = Scraper.scrapeImageElementUrls(site: site)
        tags = [""]
        
    }
    
    convenience init(){
        
        let random_string : String = "https://artofproblemsolving.com/wiki/index.php/20" + String(Int.random(in: 10..<18)) + "_AMC_8_Problems/Problem_" + String(Int.random(in: 1..<26))
        
        print("Now loading: " + random_string)
        
        //https://artofproblemsolving.com/wiki/index.php/2015_AMC_8_Problems/Problem_14
        //https://artofproblemsolving.com/wiki/index.php/2012_AMC_8_Problems/Problem_16
        
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
        
        tags.append(tag)
        
    }
    
    static func text(site: String) -> String{
        
        let raw = Scraper.pullRaw(site: site)
        
        return String(raw[Range(NSRange(location: 1300, length: 1000), in: raw)!])
        
    }
    
    
}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
