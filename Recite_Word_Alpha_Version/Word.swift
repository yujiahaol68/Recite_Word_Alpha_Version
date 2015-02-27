//
//  Word.swift
//  Recite_Word_Alpha_Version
//
//  Created by xiaobo on 15-2-25.
//  Copyright (c) 2015年 Sherlock.Yu. All rights reserved.
//

import Foundation
import CoreData

class Word: NSManagedObject {

    @NSManaged var cexplaination: String
    @NSManaged var checked: NSNumber
    @NSManaged var orialE: String
    @NSManaged var righttimes: NSNumber
    @NSManaged var wrongtimes: NSNumber

}
