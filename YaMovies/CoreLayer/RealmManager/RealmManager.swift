//
//  RealmManager.swift
//  YaMovies
//
//  Created by Beslan Tularov on 27/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    private let NotificationError = Notification.Name(rawValue: "NotificationError")
    
    var realm: Realm
    
    init() {
        let config = Realm.Configuration(schemaVersion: 2, migrationBlock: { migration, oldSchemaVersion in
            if (oldSchemaVersion < 2) {
                
            }
        })
        
        realm = try! Realm(configuration: config)
    }
    
    func create<T: Object>(_ object: T) {
        
        do {
            
            try realm.write {
                realm.add(object, update: .all)
            }
        } catch {
            post(error)
        }
    }
    
    func create<T: Object>(_ objects: [T]) {
        
        do {
            
            try realm.write {
                realm.add(objects, update: .all)
            }
        } catch {
            post(error)
        }
    }
    
    func read<T: Object>(_ object: T) -> Results<T> {
        
        let result = realm.objects(type(of: object))
        return result
    }
    
    func update<T: Object>(_ object: T, with dictionary: [String: Any]) {
        
        do {
            
            try realm.write {
                
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            post(error)
        }
    }
    
    func delete<T: Object>(_ object: T) {
        
        do {
            
            try realm.write {
                realm.delete(object)
            }
        } catch {
            post(error)
        }
    }
    
    func clear() {
        
        do {
            
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            post(error)
        }
    }
    
    func post(_ error: Error) {
        NotificationCenter.default.post(name: NotificationError, object: error)
    }
    
    func observeRealErrors(in viewController: UIViewController,
                           complation: @escaping (Error?) -> Void) {
        
        NotificationCenter.default.addObserver(forName: NotificationError,
                                               object: viewController,
                                               queue: nil) { (notification) in
                                                complation(notification.object as? Error)
        }
    }
    
    func stopObserveRealErrors(in viewController: UIViewController) {
        NotificationCenter.default.removeObserver(viewController,
                                                  name: NotificationError,
                                                  object: nil)
    }
}
