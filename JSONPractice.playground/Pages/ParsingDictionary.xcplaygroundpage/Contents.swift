//Parsing Dictionary
import Foundation

let json = """
{
 "results": [
   {
     "firstName": "John",
     "lastName": "Appleseed"
   },
  {
    "firstName": "Alex",
    "lastName": "Paul"
  }
 ]
}
""".data(using: .utf8)!

//Create models
//Codable is an alias (Decodable & Encodable)
//Decodable: Converts JSON data
//Encodable: Converts JSON data to e.g Web API
struct ResultWrapper: Decodable {
    let results: [Contact]
}

struct Contact: Decodable {
    let firstName: String
    let lastName: String
}

/*
 Decode the JSON data to our Swift Model
 */

do {
    let dictionary = try JSONDecoder().decode(ResultWrapper.self, from: json)
    let contacts = dictionary.results
    dump(contacts)
} catch {
    print("decoding error: \(error)")
}
