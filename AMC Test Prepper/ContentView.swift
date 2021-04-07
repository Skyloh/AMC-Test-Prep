//
//  ContentView.swift
//  AMC Test Prepper
//
//  Created by Nathan Gooneratne (student LM) on 3/11/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    var body: some View {
        
        Button(action: {
            /*
            Scraper.scrapeProblemText(site: "https://artofproblemsolving.com/wiki/index.php/2018_AMC_8_Problems/Problem_3")
            print("next problem")
            Scraper.scrapeProblemText(site: "https://artofproblemsolving.com/wiki/index.php/2018_AMC_8_Problems/Problem_8")
            print("next problem")
 */
            print(Scraper.scrapeSolutionText(site: "https://artofproblemsolving.com/wiki/index.php/2018_AMC_8_Problems/Problem_3"))
 
            
            
        }) {
            Text("Pray")
                .bold()
                .foregroundColor(Color.white)
                .padding(.all, 10)
                .padding(.horizontal, 30)
                .background(Color.blue)
                .cornerRadius(15)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
