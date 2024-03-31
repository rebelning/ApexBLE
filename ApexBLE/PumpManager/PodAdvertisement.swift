//
//  PodAdvertisement.swift
//  OmniBLE
//
//  Created by Pete Schwamb on 1/13/22.
//  Copyright © 2022 LoopKit Authors. All rights reserved.
//

import Foundation
import CoreBluetooth
import os.log
struct PodAdvertisement {
//    let MAIN_SERVICE_UUID = "4024"
    let MAIN_SERVICE_UUID = "FFE0"
//    let UNKNOWN_THIRD_SERVICE_UUID = "000A"
//    let UNKNOWN_THIRD_SERVICE_UUID = "2902"
    let SERVICE_UUID = "FFE5"
    
    var sequenceNo: UInt32
    var lotNo: UInt64
    var podId: UInt32

    var serviceUUIDs: [CBUUID]
    private let log = OSLog(category: "PodAdvertisement")
//    var pairable: Bool {
//        return serviceUUIDs.count >= 5 && serviceUUIDs[3].uuidString == "FFFF" && serviceUUIDs[4].uuidString == "FFFE"
//    }
    var pairable:Bool{
        return true
    }
    
    init?(_ advertisementData: [String: Any]) {
        guard var serviceUUIDs = advertisementData["kCBAdvDataServiceUUIDs"] as? [CBUUID] else {
            return nil
        }

        self.serviceUUIDs = serviceUUIDs
        log.debug("serviceUUIDs %@",serviceUUIDs[0].uuidString)
        // For some reason the pod simulator doesn't have two values.
        if serviceUUIDs.count == 7 {
            serviceUUIDs.append(CBUUID(string: "abcd"))
            serviceUUIDs.append(CBUUID(string: "dcba"))
        }
//        
//        guard serviceUUIDs.count == 9 else {
//            return nil
//        }
        
        guard serviceUUIDs[0].uuidString == MAIN_SERVICE_UUID else {
            return nil
        }
        
        // TODO understand what is serviceUUIDs[1]. 0x2470. Alarms?
        guard serviceUUIDs[1].uuidString == SERVICE_UUID else {
            return nil
        }
        
//        guard let decodedPodId = UInt32(serviceUUIDs[3].uuidString + serviceUUIDs[4].uuidString, radix: 16) else {
//            return nil
//        }
//        podId = decodedPodId、
        podId = 20240320
//        log.debug("serviceUUIDs %{public}@",podId)
        log.debug("serviceUUIDs %d",podId)
//        let lotNoString: String = serviceUUIDs[5].uuidString + serviceUUIDs[6].uuidString + serviceUUIDs[7].uuidString
//        guard let decodedLotNo =  UInt64(lotNoString[lotNoString.startIndex..<lotNoString.index(lotNoString.startIndex, offsetBy: 10)], radix: 16) else {
//            return nil
//        }
//        lotNo = decodedLotNo
        lotNo = 320
        log.debug("serviceUUIDs %d",lotNo)
//        let lotSeqString: String = serviceUUIDs[7].uuidString + serviceUUIDs[8].uuidString
//        guard let decodedSeqNo = UInt32(lotSeqString[lotSeqString.index(lotSeqString.startIndex, offsetBy: 2)..<lotSeqString.endIndex], radix: 16) else {
//            return nil
//        }
//        sequenceNo = decodedSeqNo
        sequenceNo = 320
        log.debug("serviceUUIDs %d",sequenceNo)
        
    }
}
