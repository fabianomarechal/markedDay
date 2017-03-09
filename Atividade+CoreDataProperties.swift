//
//  Atividade+CoreDataProperties.swift
//  MarkedDay
//
//  Created by Student on 3/9/17.
//  Copyright © 2017 Fabiano Leite. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Atividade {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Atividade> {
        return NSFetchRequest<Atividade>(entityName: "Atividade");
    }

    @NSManaged public var titulo: String?
    @NSManaged public var descricao: String?
    @NSManaged public var inicio: NSDate?
    @NSManaged public var termino: NSDate?

}
