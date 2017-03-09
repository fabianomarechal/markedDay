//
//  Atividade+CoreDataClass.swift
//  MarkedDay
//
//  Created by Student on 3/9/17.
//  Copyright © 2017 Fabiano Leite. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

public class Atividade: NSManagedObject {

    convenience init() {
        let context = CoreDataManager.getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Atividade", in: context)
        
        self.init(entity: entity!, insertInto: context)
    }

}
