//
//  AppSettings.swift
//  NearDrop
//
//  Created by Konstantin Adamov on 4/14/23.
//

import Foundation
class AppSettings: NSObject {
    let IncommingTransferAlertTypeKey = "IncommingTransferAlertType"
    let ComputerNameKey = "ComputerName"
    
    static let sharedInstance: AppSettings = AppSettings()
    
    var ComputerName : String = Host.current().localizedName!
    var IncommingTransferAlertType : Int = 0
    
    fileprivate override init() {
        super.init()
        
        loadSettings()
    }
    
    func loadSettings(){
        let prefs = UserDefaults.standard
        
        if prefs.object(forKey: IncommingTransferAlertTypeKey) != nil  {
            IncommingTransferAlertType = prefs.integer(forKey: IncommingTransferAlertTypeKey)
        }
        
        ComputerName = prefs.string(forKey: ComputerNameKey) ?? Host.current().localizedName!
        
    }
    
    func SaveSettings(){
        let prefs = UserDefaults.standard
        
        prefs.set(IncommingTransferAlertType, forKey: IncommingTransferAlertTypeKey)
        prefs.set(ComputerName, forKey: ComputerNameKey)
    }
  
}
