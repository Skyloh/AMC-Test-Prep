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
    let ID : Int
    
    init(site: String)  {
        
        let list = Scraper.scrapeByComponents(site: site)
        
        problemText = list[0]
        solutionText = list[1]
        
        if solutionText.contains("American Mathematics Competitions"){
            solutionText = "Error in Parsing Solution"
        }
        
        imageURLs = Scraper.scrapeImageElementUrls(site: site)
        
        tags = [""]
        
        let year = Scraper.getYear(site: site)
        
        let problem_num = site.replacingOccurrences(of: "https://artofproblemsolving.com/wiki/index.php/" + year + "_AMC_8_Problems/Problem_", with: "")
        
        ID = Int(Scraper.getYear(site: site) + problem_num) ?? -1
      
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
    
//addTags was here
    
    //WIP
    func formatTextWithImages() {
        print("text: " + self.solutionText)
    }
    

}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
