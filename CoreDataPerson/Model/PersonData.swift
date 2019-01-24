//
//  DataService.swift
//  CoreDataPerson
//
//  Created by daicudu on 1/23/19.
//  Copyright © 2019 daicudu. All rights reserved.
//

import UIKit

extension Person  {
    convenience init(name: String?, ageText: String?, image: UIImage?) {
        self.init(context: AppDelegate.context)
        self.name = name
        if let ageText = ageText, let age = Int64(ageText)  {
            self.age = age
        }
        self.avatar = image?.pngData()
    }
}
