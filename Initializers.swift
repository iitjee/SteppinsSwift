/*
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID203



*/




- involves setting an initial value for each stored property on that instance and performing any other setup or initialization that is required before the new instance is ready for use.
- Unlike Objective-C initializers, Swift initializers do not return a value. Their primary role is to ensure that new instances of a type are correctly initialized before they are used for the first time.
- Instances of class types can also implement a deinitializer, which performs any custom cleanup just before an instance of that class is deallocated.

/*  Setting Initial Values for Stored Properties  */
//In classes and structs, Stored properties cannot be left in an indeterminate state by the time an instance of that class or structure is created.
//You can set an initial value for a stored property within an initializer, or by assigning a default property value as part of the property’s definition.
//NOTE: When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers.

//1)  In its simplest form, an initializer is like an instance method with no parameters
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")  // Prints "The default temperature is 32.0° Fahrenheit"

//2)  Or giving default value to the stored property
//The end result is the same, but the default value ties the property’s initialization more closely to its declaration. It makes for shorter, clearer initializers and enables you to infer the type of the property from its default value. 
//The default value also makes it easier for you to take advantage of default initializers and initializer inheritance, as described later in this chapter.
struct Fahrenheit {
    var temperature = 32.0
}


/*  Customizing Initialization  */
//You can customize the initialization process with input parameters and optional property types, or by assigning constant properties during initialization, as described in the following sections.

/*Initialization Parameters*/
struct Celsius {
    var temperatureInCelsius: Double
    /*  two custom initializers */
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)  // boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)  // freezingPointOfWater.temperatureInCelsius is 0.0



/*  Parameter Names and Argument Labels  */
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

let veryGreen = Color(0.0, 1.0, 0.0)  // this reports a compile-time error - argument labels are required
//(Argument labels must always be used in an initializer if they are defined, and omitting them is a compile-time error:)



/*  Initializer Parameters Without Argument Labels  */
//If you do not want to use an argument label for an initializer parameter, write an underscore (_) instead of an explicit argument label for that parameter to override the default behavior.
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius(37.0) // bodyTemperature.temperatureInCelsius is 37.0

/*  Optional Property Types */
//Properties of optional type are automatically initialized with a value of nil, indicating that the property is deliberately intended to have “no value yet” during initialization.
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()  // Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."

/*  Assigning Constant Properties During Initialization    */
//IMPORTANT: You can assign a value to a constant property at any point during initialization, as long as it is set to a definite value by the time initialization finishes. Once a constant property is assigned a value, it can’t be further modified.
//IMPORTANT: For class instances, a constant property can be modified during initialization only by the class that introduces it. It cannot be modified by a subclass.
class SurveyQuestion {
    let text: String  //Even though the text property is now a constant, it can still be set within the class’s initializer:
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask() // Prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"





