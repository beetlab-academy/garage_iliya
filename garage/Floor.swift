import Cocoa

class Floor {
    var places: [String]
    
    init (places: [String]) {
        self.places = places
    }
    
    func empty () -> Bool{
        var counter = 0
        for i in 0..<places.count {
            if places[i] != "" {
                counter += 1
            }
        }
        if counter == places.count {
            return false
        } else {
            return true
        }
    }
    
    func park(car: Car) -> [Int] {
        
        var placeId: [Int] = []
        var exit = false
        var allEmpty = false
        
        if car.type == .car {
            let tmp = Int.random(in: 0..<places.count)
            if places[tmp] == "" {
                places[tmp] = car.plate
                placeId.append(tmp+1)
            } else {
                return park(car: car)
            }
        }
        
        if car.type == .bus {
            repeat {
                let tmp = Int.random(in: 0..<places.count)
                if places.count-3 <= tmp {
                    for i in places.count-3..<places.count {
                        if places[i] == "" {
                            allEmpty = true
                        } else {
                            allEmpty = false
                        }
                    }
                    if allEmpty == true {
                        for i in places.count-3..<places.count {
                            if places[i] == "" {
                                places[i] = car.plate
                                placeId.append(i+1)
                            }
                        }
                        exit = true
                    }
                } else {
                    for i in tmp..<3+tmp {
                        if places[i] == "" {
                            allEmpty = true
                        } else {
                            allEmpty = false
                        }
                    }
                    if allEmpty == true {
                        for i in tmp..<3+tmp {
                            if places[i] == "" {
                                places[i] = car.plate
                                placeId.append(i+1)
                            }
                        }
                        exit = true
                    }
                }
            
            } while exit != true
        
            
        }
        return placeId
    }
    

    func returnPlate (id: Int) -> String {
        return places[id]
    }
}


//func park(car: Car) -> [Int] {
//        var placeId: [Int] = []
//        var exit = false
//        var allEmpty = false
//        repeat {
//            let tmp = randomNum(range: 0..<places.count)
//            if car.size > 1 {
//                if places.count-car.size <= tmp {
//                    for i in places.count-car.size..<places.count {
//                        if places[i] == "" {
//                            allEmpty = true
//                        } else {
//                            allEmpty = false
//                        }
//                    }
//                    if allEmpty == true {
//                        for i in places.count-car.size..<places.count {
//                            if places[i] == "" {
//                                places[i] = car.plate
//                                placeId.append(i+1)
//                            }
//                        }
//                        exit = true
//                    }
//                } else {
//                    for i in tmp..<car.size+tmp {
//                        if places[i] == "" {
//                            allEmpty = true
//                        } else {
//                            allEmpty = false
//                        }
//                    }
//                    if allEmpty == true {
//                        for i in tmp..<car.size+tmp {
//                            if places[i] == "" {
//                                places[i] = car.plate
//                                placeId.append(i+1)
//                            }
//                        }
//                        exit = true
//                    }
//                }
//            } else {
//                if places[tmp] == "" {
//                    places[tmp] = car.plate
//                    placeId.append(tmp+1)
//                    exit = true
//                }
//            }
//            allEmpty = false
//
//        } while exit != true
//
//        return placeId
//    }


//var exit = false
//repeat {
//    let tmp = Int.random(in: 0..<places.count)  //randomNum(range: 0..<places.count)
//    if places[tmp] == "" {
//        places[tmp] = car.plate
//        placeId = tmp+1
//        exit = true
//    }
//} while exit != true
