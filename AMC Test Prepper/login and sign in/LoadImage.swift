//
//  LoadImage.swift
//  AMC Test Prepper
//
//  Created by Nathan Cengel (student LM) on 4/8/21.
//  Copyright © 2021 Nathan Gooneratne (student LM). All rights reserved.
//

import Foundation
import SwiftUI
class LoadImage{
    class func loadImage(_ urlString: String?) -> UIImage{
        do{
            guard var unWrappedString = urlString else { return UIImage(named: "default") ?? UIImage() }
            unWrappedString = "https:" + unWrappedString
            guard let url = URL(string: unWrappedString) else { return UIImage(named: "default") ?? UIImage()}
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
            
        } catch{
            return UIImage(named: "default") ?? UIImage()
        }
    }
}
