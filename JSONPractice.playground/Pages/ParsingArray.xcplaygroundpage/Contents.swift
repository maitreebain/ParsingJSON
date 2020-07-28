import Foundation

let json = """
[
    {
        "title": "New York",
        "location_type": "City",
        "woeid": 2459115,
        "latt_long": "40.71455,-74.007118"
    }
]
""".data(using: .utf8)!

//Create Models

struct Location: Decodable {
    let title: String
    let locationType: String
    let woeid: Int
    let coordinate: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        case woeid
        case coordinate = "latt_long"
    }
}

/*
Decode the JSON data to our Swift Model
*/

do {
    let weather = try JSONDecoder().decode([Location].self, from: json)
    dump(weather)
} catch {
    print("\(error)")
}
