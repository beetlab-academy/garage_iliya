import Cocoa


class Garage {
    var floors: [Floor]

    init(floors: [Floor]) {
        self.floors = floors
    }
     func park (car: Car) -> parkingTicket {
        var ticket = parkingTicket(level: 0, placeId: [])
         var exit = false
         repeat {
             let tmp = Int.random(in: 0..<floors.count)
             if floors[tmp].empty() == true {
                 ticket.placeId = floors[tmp].park(car: car)
                 ticket.level = tmp+1
                 exit = true
             }
         } while exit != true
         
         return ticket
     }
    
//    func returnPlate (ticket: parkingTicket) -> String {
//        return floors[ticket.level-1].returnPlate(id: ticket.placeId)
//    }
}

struct SlotImpl: Slot {
    let id: Int
    var isEmpty: Bool
}

struct FloorImpl: Floor1 {
    let id: Int
    var slots: [Slot]
}

class Garage1 {
    var algo: ParkingAlgorithm! // injected
    var floors: [Floor1]! // injected
    
    func park(car: Car) -> Result<Ticket, ParkingAlgorithmError> {
        .success(Ticket(floorId: 1, slotId: [2]))
    }
}

protocol FloorsFactory {
    func generateFloors() -> [Floor1]
}

class DefaultFloorsFactory: FloorsFactory {
    func generateFloors() -> [Floor1] {
        []
    }
}

class GarageAssembly {
    lazy var algoAssembly = AlgorithmAssembly()
    
    var garage: Garage1 {
        let garage = Garage1()
        garage.algo = algoAssembly.algorithm
        garage.floors = defaultFactory.generateFloors()
        
        return garage
    }
    
    func garage(with factory: FloorsFactory) -> Garage1 {
        let garage = Garage1()
        garage.algo = algoAssembly.algorithm
        garage.floors = factory.generateFloors()
        
        return garage
    }

    
    var defaultFactory: FloorsFactory {
        DefaultFloorsFactory()
    }
}

class AlgorithmAssembly {
    var algorithm: ParkingAlgorithm {
        let algo = ParkingAlgorithmImpl()
        algo.sizeMap = self.parkingSizeMap
        return algo
    }
    
    var parkingSizeMap: ParkingSizeMap {
        ParkingSizeMapImpl()
    }
}
