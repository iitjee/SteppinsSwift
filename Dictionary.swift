/*  

Swift’s Dictionary type is bridged to Foundation’s NSDictionary class.





*/



/* Create Empty Dictionary */
var namesOfIntegers = [Int: String]()
var namesOfIntegers: [Int: String] = [:]

/* Creating Dictionary */
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]  //Array Literal Syntax
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]  //Array Literal Syntax with implicit type inference (since all are of similar type)

/*Checking Emptiness*/  airports.isEmpty
/* All keys */  [String](airports.keys)
/* All values */ [String](airports.values)

/*Updating Value  (two ways)  */
airports["LHR"] = "London Heathrow"
airports.updateValue("London Heathrow", forKey: "LHR")

//Note: Unlike a subscript, however, the updateValue(_:forKey:) method returns the old value after performing an update. This enables you to check whether or not an update took place.
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
} // Prints "The old value for DUB was Dublin."

//Note2: For a given key, A dictionary’s subscript returns an optional value of the dictionary’s value type. So it's always better to unwrap using optional binding
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

/*  Removing an item  (two ways)  */
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).") //this way you can get reference to the deleted item
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

/* Iterating over dictionary  */
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//Note: airport.keys and airport.values are not exactly arrays. They return iteratorable objects used only while iterating. To get an array, use [String}(airports.keys)
















