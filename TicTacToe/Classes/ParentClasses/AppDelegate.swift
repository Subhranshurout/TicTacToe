//
//  AppDelegate.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 25/12/23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TicTacToe")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    lazy var context = persistentContainer.viewContext
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func createGameHistory( game : GameData) {
        let gameData = GameHistory(context: context)
        gameData.gameMode = game.gameMode
        gameData.winner = game.winner
        gameData.dateOp = game.dateOp
        gameData.timeOp = game.timeOp
        saveContext()
        print("Data saved to CoreData")
    }

//    func fetchGameHistory() -> [GameData] {
//        do {
//            guard let result = try context.fetch(GameHistory.fetchRequest()) as? [GameData] else {return [] }
//            print("Data fetched from CoreData")
//            return result
//        } catch let error
//        {
//            debugPrint(error)
//        }
//        return []
//    }
    
    // MARK: - App Methods
//    func redirectToHomeScreen() {
//        let entryStory = UIStoryboard(name: "Home", bundle: nil)
//        
//        let HomeVC = entryStory.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//
//        if let nav = _appDelegator.window?.rootViewController as? KPNavigationViewController {
//            nav.viewControllers = [HomeVC]
//        }
//    }
    
    func isAppOpenForFirstTime() {
        if let nav = _appDelegator.window?.rootViewController as? KPNavigationViewController {
            if _userDefault.object(forKey: "kFirstTimeUser") as? Bool ?? false {
                let HomeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                nav.viewControllers = [HomeVC]
            } else {
                _userDefault.set(true, forKey: "kFirstTimeUser")
                let walkThroughVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WalkthroughVC") as! WalkthroughVC
                nav.viewControllers = [walkThroughVC]
            }
        }
    }
    
}

