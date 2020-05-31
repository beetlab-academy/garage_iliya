//
//  ParkingAlgorithm.swift
//  garage3.0
//
//  Created by nikita on 31/05/2020.
//  Copyright © 2020 Ilya. All rights reserved.
//

import Foundation

enum ParkingSize {
    case small
    case medium
    case large
}

protocol ParkingSizeMap {
    func parkingSlots(for size: ParkingSize) -> Int
}

protocol Slot {
    var id: Int { get }
    var isEmpty: Bool { get set }
}

protocol Floor1 {
    var id: Int { get }
    var slots: [Slot] { get set }
}

struct Ticket {
    let floorId: Int
    let slotId: [Int]
}

enum ParkingAlgorithmError: Error {
    case noPlaceFound
    case noPlaceForTicketFound
}

protocol ParkingAlgorithm {
    var sizeMap: ParkingSizeMap! { set get }
    
    func park(itemOfSize: ParkingSize,
              floor: [Floor1]) -> Result<(ticket: Ticket, newScheme: [Floor1]), ParkingAlgorithmError>
    func unpark(floor: [Floor1], ticket: Ticket) -> Result<[Floor1], ParkingAlgorithmError>
}

class ParkingSizeMapImpl: ParkingSizeMap {
    func parkingSlots(for size: ParkingSize) -> Int {
        switch size {
        case .small:
            return 1
        case .medium:
            return 2
        case .large:
            return 3
        }
    }
}

class ParkingAlgorithmImpl {
    var sizeMap: ParkingSizeMap! // injected
}

extension ParkingAlgorithmImpl: ParkingAlgorithm {
    func park(itemOfSize: ParkingSize,
              floor: [Floor1]) -> Result<(ticket: Ticket, newScheme: [Floor1]), ParkingAlgorithmError> {
        var copy = floor
        let itemSize = sizeMap.parkingSlots(for: itemOfSize)
        let tuple = (Ticket(floorId: 1, slotId: [1,2,3]), copy)
        
        return .success(tuple)
        return .failure(.noPlaceFound)
    }
    
    func unpark(floor: [Floor1], ticket: Ticket) -> Result<[Floor1], ParkingAlgorithmError> {
        return .success(floor)
    }
}

