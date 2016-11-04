/* https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html */

/*  Important Points:
myStr.startIndex != 0       It is some other object. For simplicity you can think of it as a start iterator.




*/

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

let someString = "Some string literal value"  //String literal


/* Checking an Empty String */
if emptyString.isEmpty {
    print("Nothing to see here")
}

/*Concatenating Strings */
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
var string1 += string2

/* To append a character */
let exclamationMark: Character = "!"  //note that Character type is strictly mentioned, else it will infer as String.
welcome.append(exclamationMark)

/* Mutability of Strings */
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"
 
let constantString = "Highlander"
constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified


/* Working with characters */
for character in "Dog!🐶".characters {
    print(character)
    
/* Legnth Of String */
myString.characters.count
    
/* String interpolation is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal. 
Each item that you insert into the string literal is wrapped in a pair of parentheses, prefixed by a backslash: */
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

    
/* String Indices */    /*1)myStr.startIndex  2)myStr.endIndex  3)myStr.index(before:)  4)myStr.index(after:) 5)myStr.index(_, offsetBy:) */
let greeting = "Guten Tag!"
greeting[greeting.startIndex]   // G
greeting[greeting.index(before: greeting.endIndex)]// !  
//Note that myStr.endIndex gives the index after the last element. Hence we never use it directly
greeting[greeting.index(after: greeting.startIndex)]    // u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index] // a

//Use the indices property of the characters property to access all of the indices of individual characters in a string.
for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}   // Prints "G u t e n   T a g ! "

/*  Inserting and Removing  */  1) welcome.insert(_, at:) 2)myStr.insert(ContentsOf: at:)
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"
 
welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"

/* Removing Characters and Substrings */
welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"
 
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"


/* Comparing Strings */
//Just use == and !=
//Note e and e´are considered equivalent in Swift

/* Prefix and Suffix Strings */
myStr.hasPrefix(_:) and myStr.hasSuffix(_:)


let upper = mixedCase.uppercased()       // "ABCDEF"
let lower = mixedCase.lowercased()       // "abcdef"







