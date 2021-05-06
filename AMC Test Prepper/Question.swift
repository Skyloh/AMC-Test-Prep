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
    
    var problemText : [String]
    var solutionText : [String]
    var imageURLs : [String]
    var tags : [String]
    var site : String
    let ID : Int
    
    
    init(site: String)  {
        
        self.site = site
        
        let list = Scraper.formatText(site: site)
        
        // the code may be clumsy, the project may not work,
        // but at least these two lines look nice
        problemText = list[0].components(separatedBy: "|").filter{
            $0.count > 0
        }
        solutionText = list[1].components(separatedBy: "|").filter{
            $0.count > 0
        }
        
        
        imageURLs = Scraper.scrapeImageElementUrls(site: site)
        
        tags = [""]
        
        let year = Scraper.getYear(site: site)
        
        let problem_num = site.replacingOccurrences(of: "https://artofproblemsolving.com/wiki/index.php/" + year + "_AMC_8_Problems/Problem_", with: "")
        
        ID = Int(Scraper.getYear(site: site) + problem_num) ?? -1
        
    }
    
    convenience init() {
        
        // wooooo nonliteral stringssssss
        let random_string : String = "https://artofproblemsolving.com/wiki/index.php/20\(Int.random(in: 10..<20))_AMC_8_Problems/Problem_\(Int.random(in: 1..<23))"
        
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
    
    
    // Unused method that would've worked with Cengel's unmerged TagView
    func addTag(tag: String){
        
        if !tags.contains(tag) {
            tags.append(tag)
        }
        
    }
    
    
    
    
}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
