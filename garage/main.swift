import Foundation

//в этой версии на вход функции park поступает объект типа Сar, состоящий из номера машины и ее размера (размер - количество парковочных мест, которые занимает машина)
let wheel = Car(plate: "у121cр777", type: .bus)
//Задаем параметры гаража
var hfk: Garage = createGrage(floors: 3, places: 5)

//Метод park паркует автомобиль в абослютно рандомное место

print(hfk.park(car: wheel))
//print(hfk.park(car: wheel))
//print(hfk.park(car: wheel))
//print(hfk.park(car: wheel))
//print(hfk.park(car: wheel))
//print(hfk.park(car: wheel))
//print(hfk.park(car: wheel))
//print(hfk.park(car: wheel))
//print(hfk.park(car: wheel))
//print(hfk.park(car: wheel))
//let ticket = parkingTicket(level: 1, placeId: [3])



for i in 0..<3 {
    print(hfk.floors[i].places)
}

class MyFactory: FloorsFactory {
    func generateFloors() -> [Floor1] {
        []
    }
}

let garage1 = GarageAssembly().garage
let garage2 = GarageAssembly().garage(with: MyFactory())
let result = garage1.park(car: wheel)

switch result {
case .success(let ticket):
    print(ticket.floorId)
case .failure(let error):
    switch error {
    case .noPlaceForTicketFound:
        break
    case .noPlaceFound:
        break
    }
}


