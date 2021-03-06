//
//  AppDelegate.swift
//  helloPush
//
//  Created by Meryem Alay on 21/10/2018.
//  Copyright © 2018 Meryem Alay. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map{String(format: "%02.2hhx", $0)}.joined()
        print("token: \(token)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping
        (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
        print("deneme")
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let data = response.notification.request.content.userInfo
        print(data)
        print("------------")
        if let messageID = data["key1"] {
            print("Message ID: \(messageID)")
        }
        
        let aps = data["aps"] as! Dictionary<String, Any>
        let alert = aps["alert"] as! String
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let second = sb.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        window?.rootViewController = second
        
        let price = data["price"]
        let outboundDate = data["outbound-date"]//"27 Oct 2018"
        let outboundDeparture = data["outbound-departure"]//"LGW 09:15"
        let outboundArrival = data["outbound-arrival"]//"AMS 11:25"
        
        let inboundDate = data["inbound-date"]//"29 Oct 2018"
        let inboundDeparture = data["inbound-departure"]//"AMS 07:05"
        let inboundArrival = data["inbound-arrival"]//"LGW 07:20"
        let bookId = data["book-id"]
        if let rootViewController = window?.rootViewController as? SecondViewController {
            
            rootViewController.loadText(price: price as! String, outboundDate: outboundDate as! String, outboundDeparture: outboundDeparture as! String, outboundArrival: outboundArrival as! String, inboundDate: inboundDate as! String, inboundDeparture: inboundDeparture as! String, inboundArrival: inboundArrival as! String,
                                        bookId: bookId as! String)
        }
        
        completionHandler()
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
       
        UNUserNotificationCenter.current().delegate = self

        UNUserNotificationCenter.current().requestAuthorization(options:
            [.alert, .badge, .sound], completionHandler: {(granted, error) in
                print("granted: \(granted)")
        })

        UIApplication.shared.registerForRemoteNotifications()
        
        return true
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "helloPush")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

