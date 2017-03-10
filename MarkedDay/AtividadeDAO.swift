//
//  AtividadeDAO.swift
//  MarkedDay
//
//  Created by Student on 3/9/17.
//  Copyright © 2017 Fabiano Leite. All rights reserved.
//

import Foundation
import CoreData

class AtividadeDAO {
    
    static func insert() -> Bool {
        var result = false
        
        do {
            try CoreDataManager.getContext().save()
            result = true
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return result
    }
    
    static func update() -> Bool {
        var result = false
        
        do {
            try CoreDataManager.getContext().updatedObjects
            result = true
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return result
    }
    
    static func delete(atividade: Atividade) -> Bool {
        var result = false
        
        CoreDataManager.getContext().delete(atividade)
        
        do {
            try CoreDataManager.getContext().save()
            result = true
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return result
    }
    
    static func searchAll() -> [Atividade] {
        var atividades = [Atividade]()
        let request: NSFetchRequest<Atividade> = Atividade.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor.init(key: "titulo", ascending: true)]
        
        
        do {
            try atividades = CoreDataManager.getContext().fetch(request)
            print("Total de atividades cadastrados = ", atividades.count)
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return atividades
    }
    
    
}
