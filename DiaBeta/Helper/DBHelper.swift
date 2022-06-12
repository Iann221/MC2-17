//
//  DBHelper.swift
//  DiaBeta
//
//  Created by Vincentius Ian Widi Nugroho on 11/06/22.
//

import Foundation
import CoreData
import UIKit

class DBHelper {
    
    static let shared = DBHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var gulaList: [GulaDarah] = []
    private var foodList: [Food] = []
    
    
    private init(){}
    
    // get semua data gula
    func getAllGula() -> [GulaDarah]{
        do{
            gulaList = try context.fetch(GulaDarah.fetchRequest())
        } catch {
            print("error")
        }
        return gulaList
    }
    
    // get semua data gula tapi sorted
    func getAllSortedGula() -> [GulaDarah]{
        do{
            let request = GulaDarah.fetchRequest() as NSFetchRequest<GulaDarah>
            
            let sort = NSSortDescriptor(key: "timestamp", ascending: true)
            request.sortDescriptors = [sort]
            
            gulaList = try context.fetch(request)
        } catch {
            print("error")
        }
        return gulaList
    }
    
    // get data gula untuk tanggal spesifik, parameter: Date
    func getDateGula(_ pickedDate: Date) -> [GulaDarah] {
        do{
            let request = GulaDarah.fetchRequest() as NSFetchRequest<GulaDarah>
            
            var calendar = Calendar.current
            calendar.timeZone = NSTimeZone.local
            
            // Get today's beginning & end
            let dateFrom = calendar.startOfDay(for: pickedDate)
            let dateTo = calendar.date(byAdding: .day, value: 1, to: dateFrom)

            // Set predicate as date being today's date
            let fromPredicate = NSPredicate(format: "timestamp >= %@", dateFrom as NSDate)
            let toPredicate = NSPredicate(format: "timestamp < %@", dateTo! as NSDate)
            let datePredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [fromPredicate, toPredicate])
            request.predicate = datePredicate
            
            // sort
            let sort = NSSortDescriptor(key: "timestamp", ascending: true)
            request.sortDescriptors = [sort]
            
            gulaList = try context.fetch(request)
            
        } catch {
            print("error")
        }
        return gulaList
    }
    
    // get data gula untuk 7 hari, parameter: Date hari ini
    func getWeekGula(_ pickedDate: Date) -> [GulaDarah] {
        do{
            let request = GulaDarah.fetchRequest() as NSFetchRequest<GulaDarah>
            
            var calendar = Calendar.current
            calendar.timeZone = NSTimeZone.local
            
            // Get today's beginning & end
            let dateSelected = calendar.startOfDay(for: pickedDate)
            let dateTo = calendar.date(byAdding: .day, value: 1, to: dateSelected)
            let dateFrom = calendar.date(byAdding: .day, value: -7, to: dateTo!)

            // Set predicate as date being today's date
            let fromPredicate = NSPredicate(format: "timestamp >= %@", dateFrom! as NSDate)
            let toPredicate = NSPredicate(format: "timestamp < %@", dateTo! as NSDate)
            let datePredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [fromPredicate, toPredicate])
            request.predicate = datePredicate
            
            // sort
            let sort = NSSortDescriptor(key: "timestamp", ascending: true)
            request.sortDescriptors = [sort]
            
            gulaList = try context.fetch(request)
            
        } catch {
            print("error")
        }
        return gulaList
    }
    
    // get data gula untuk 30 hari, parameter: Date hari ini
    func getMonthGula(_ pickedDate: Date) -> [GulaDarah] {
        do{
            let request = GulaDarah.fetchRequest() as NSFetchRequest<GulaDarah>
            
            var calendar = Calendar.current
            calendar.timeZone = NSTimeZone.local
            
            // Get today's beginning & end
            let dateSelected = calendar.startOfDay(for: pickedDate)
            let dateTo = calendar.date(byAdding: .day, value: 1, to: dateSelected)
            let dateFrom = calendar.date(byAdding: .day, value: -30, to: dateTo!)

            // Set predicate as date being today's date
            let fromPredicate = NSPredicate(format: "timestamp >= %@", dateFrom! as NSDate)
            let toPredicate = NSPredicate(format: "timestamp < %@", dateTo! as NSDate)
            let datePredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [fromPredicate, toPredicate])
            request.predicate = datePredicate
            
            // sort
            let sort = NSSortDescriptor(key: "timestamp", ascending: true)
            request.sortDescriptors = [sort]
            
            gulaList = try context.fetch(request)
            
        } catch {
            print("error")
        }
        return gulaList
    }
    
    // menambah data input gula darah ke db
    func createGula(timestamp: Date, event: String, jumlah: Int64){
        let guldar = GulaDarah(context: context)
        guldar.event = event
        guldar.jumlah = jumlah
        guldar.timestamp = timestamp
        do {
            try context.save()
        } catch {
            print("error")
        }
    }

    // function to get food
    // get semua data makanan
    func getAllFood() -> [Food]{
        do{
            foodList = try context.fetch(Food.fetchRequest())
        } catch {
            print("error")
        }
        return foodList
    }
    
    // get semua data food tapi sorted
    func getAllSortedFood() -> [Food]{
        do{
            let request = Food.fetchRequest() as NSFetchRequest<Food>
            
            let sort = NSSortDescriptor(key: "timestamp", ascending: true)
            request.sortDescriptors = [sort]
            
            foodList = try context.fetch(request)
        } catch {
            print("error")
        }
        return foodList
    }
    
    // get data makanan tanggal tertentu, parameter: Date
    func getDateFood(_ pickedDate: Date) -> [Food] {
        do{
            let request = Food.fetchRequest() as NSFetchRequest<Food>
            
            var calendar = Calendar.current
            calendar.timeZone = NSTimeZone.local
            // Get today's beginning & end
            let dateFrom = calendar.startOfDay(for: pickedDate) // eg. 2016-10-10 00:00:00
            let dateTo = calendar.date(byAdding: .day, value: 1, to: dateFrom)

            // Set predicate as date being today's date
            let fromPredicate = NSPredicate(format: "timestamp >= %@", dateFrom as NSDate)
            let toPredicate = NSPredicate(format: "timestamp < %@", dateTo! as NSDate)
            let datePredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [fromPredicate, toPredicate])
            request.predicate = datePredicate
            
            // sort
            let sort = NSSortDescriptor(key: "timestamp", ascending: true)
            request.sortDescriptors = [sort]
            
            foodList = try context.fetch(request)
            
        } catch {
            print("error")
        }
        return foodList
    }
    
    // menambah data makanan baru ke db
    func createFood(timestamp: Date, nama: String, category: [String],image: NSData){
        let food = Food(context: context)
        food.category = category
        food.name = nama
        food.photo = image
        food.timestamp = timestamp
        do {
            try context.save()
        } catch {
            print("error")
        }
    }

}
