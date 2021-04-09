//
//  Question.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 4/9/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import Foundation
import SwiftUI

struct Question{
    
    var problemText : String
    var solutionText : String
    var imageURLs: [String]
    
    init(site: String){
        
        problemText = Scraper.scrapeProblemText(site: site)
        solutionText = Scraper.scrapeSolutionText(site: site)
        imageURLs = Scraper.scrapeImageElementUrls(site: site)
        
    }
    
    //returns an image from the specified index
    func loadFromIndex(index: Int) -> Image{
        
        if let data = try? Data(contentsOf: URL(string: imageURLs[index])!){
            return Image(uiImage: UIImage(data: data)!)
        }
        
        return Image("")
    }
    
    
}
