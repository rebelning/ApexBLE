//
//  OmniBLE.swift
//  OmniBLE
//
//  Created by Randall Knutson on 10/11/21.
//  Copyright © 2021 LoopKit Authors. All rights reserved.
//

import Foundation
import OSLog


public class ApexBLE {
    var manager: PeripheralManager
    var advertisement: PodAdvertisement?

    private let log = OSLog(category: "ApexBLE")

    init(peripheralManager: PeripheralManager, advertisement: PodAdvertisement?) {
        self.manager = peripheralManager        
        self.advertisement = advertisement
    }
}


extension ApexBLE: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "ApexBLE - advertisement: \(String(describing: advertisement))"
    }
}
