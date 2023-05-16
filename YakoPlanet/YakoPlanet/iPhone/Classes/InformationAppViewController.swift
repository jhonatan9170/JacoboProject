//
//  InformationAppViewController.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 16/04/23.
//

import UIKit

class InformationAppViewController: UIViewController {

    let colorProfileKey = "ColorProfile"
    let safeAreaColorKey = "SafeAreaColor"
    let backgroundColorKey = "BackgroundColor"
    let searchBarColorKey = "SearchBarColor"
    let tabBarColorKey = "TabBarColor"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(handleColorProfileChanged), name: NSNotification.Name(rawValue: "ColorProfileChanged"), object: nil)
    }
    
    @objc func handleColorProfileChanged() {
        let safeAreaColorKey = UserDefaults.standard.string(forKey: safeAreaColorKey) ?? ""
        let backgroundColorHex = UserDefaults.standard.string(forKey: backgroundColorKey) ?? ""
        let tabBarColorHex = UserDefaults.standard.string(forKey: tabBarColorKey) ?? ""
        
        view.backgroundColor = UIColor(hexString: backgroundColorHex)

        if let tabBarController = tabBarController {
            let tabBarItemColor = UIColor(hexString: tabBarColorHex)
            tabBarController.tabBar.tintColor = tabBarItemColor
        }
    }
    
    @IBAction func changeColorProfile1(_ sender: Any) {
        UserDefaults.standard.set("Profile1", forKey: colorProfileKey)
        updateAppColors()
    }
    
    @IBAction func changeColorProfile2(_ sender: Any) {
        UserDefaults.standard.set("Profile2", forKey: colorProfileKey)
        updateAppColors()
    }
    
    @IBAction func changeColorProfile3(_ sender: Any) {
        UserDefaults.standard.set("Profile3", forKey: colorProfileKey)
        updateAppColors()
    }
    
    func updateAppColors() {
        let colorProfile = UserDefaults.standard.string(forKey: colorProfileKey) ?? ""

        switch colorProfile {
        case "Profile1":

            let safeAreaColor = UIColor.green
            let backgroundColor = UIColor.green
            let searchBarColor = UIColor.green
            let tabBarColor = UIColor.green

            UserDefaults.standard.set(safeAreaColor.hexString, forKey: safeAreaColorKey)
            UserDefaults.standard.set(backgroundColor.hexString, forKey: backgroundColorKey)
            UserDefaults.standard.set(searchBarColor.hexString, forKey: searchBarColorKey)
            UserDefaults.standard.set(tabBarColor.hexString, forKey: tabBarColorKey)

        case "Profile2":

            let safeAreaColor = UIColor.yellow
            let backgroundColor = UIColor.yellow
            let searchBarColor = UIColor.yellow
            let tabBarColor = UIColor.yellow

            UserDefaults.standard.set(safeAreaColor.hexString, forKey: safeAreaColorKey)
            UserDefaults.standard.set(backgroundColor.hexString, forKey: backgroundColorKey)
            UserDefaults.standard.set(searchBarColor.hexString, forKey: searchBarColorKey)
            UserDefaults.standard.set(tabBarColor.hexString, forKey: tabBarColorKey)

        case "Profile3":

            let safeAreaColor = UIColor.purple
            let backgroundColor = UIColor.purple
            let searchBarColor = UIColor.purple
            let tabBarColor = UIColor.purple

            UserDefaults.standard.set(safeAreaColor.hexString, forKey: safeAreaColorKey)
            UserDefaults.standard.set(backgroundColor.hexString, forKey: backgroundColorKey)
            UserDefaults.standard.set(searchBarColor.hexString, forKey: searchBarColorKey)
            UserDefaults.standard.set(tabBarColor.hexString, forKey: tabBarColorKey)

        default:
            break
        }

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ColorProfileChanged"), object: nil)
    }

}
