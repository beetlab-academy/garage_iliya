import Foundation

enum CarType {
    case motorcycle // два мотоцикла занимают одно парковочное место
    case car // занимает одно парковочное место
    case bus // занимает три парковочных места
}

struct parkingTicket {
    var level: Int
    var placeId: [Int]
}

struct Car {
    var plate: String
    var type: CarType
}


func createGrage(floors: Int, places: Int) -> Garage{
    var newPlaces: [String] = []
    var newFloors: [Floor] = []
    for _ in 0..<places {
        newPlaces.append("")
    }
    for _ in 0..<floors {
        newFloors.append(Floor(places: newPlaces))
    }
    return Garage(floors: newFloors)
}


//func randomNum(range: Range<Int> ) -> Int {
//        var offset = 0
//
//        if range.startIndex < 0   {
//            offset = abs(range.startIndex)
//        }
//
//        let min = UInt32(range.startIndex + offset)
//        let max = UInt32(range.endIndex + offset)
//
//        return Int(min + arc4random_uniform(max - min)) - offset
//}
