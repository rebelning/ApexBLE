//
//  OmniBLEPlugin.swift
//  OmniBLE
//
//  Based on OmniKitPlugin/OmniKitPlugin.swift
//  Created by Randall Knutson on 09/11/21.
//  Copyright © 2021 LoopKit Authors. All rights reserved.
//

import Foundation
import LoopKitUI
import ApexBLE
import os.log

class ApexBLEPlugin: NSObject, PumpManagerUIPlugin { //OmniBLEPlugin
    private let log = OSLog(category: "ApexBLEPlugin")

    public var pumpManagerType: PumpManagerUI.Type? {
        return ApexBLEPumpManager.self
    }

    public var cgmManagerType: CGMManagerUI.Type? {
        return nil
    }

    override init() {
        super.init()
        log.default("ApexBLEPlugin Instantiated") //OmniBLEPlugin Instantiated
    }
}
