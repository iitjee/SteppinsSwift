/*



*//


/*
 You can use a set instead of an array when the order of items is not important, or 
 when you need to ensure that an item only appears once.
(Swift’s Set type is bridged to Foundation’s NSSet class.)

A  type must be hashable in order to be stored in a set—that is, the type must provide a way to compute a hash value for itself.
All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default, and can be used as SET VALUE types or DICTIONARY KEY types.

/*  You can use your own custom types as set value types or dictionary key types by making them conform to the Hashable protocol from Swift’s standard library. Types that conform to the Hashable protocol must provide a gettable Int property called hashValue. */

*/



/*  Initializing Empty Set */
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]  //Array Literal Syntax

/* Note: A set type cannot be inferred from an array literal alone, so the type Set must be explicitly declared. However, because of Swift’s type inference, you don’t have to write the type of the set if you’re initializing it with an array literal containing values of the same type.  
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"] //also works fine */

letters.insert("a")
// letters now contains 1 value of type Character
letters = []
// letters is now an empty set, but is still of type Set<Character>


/*  count */    favoriteGenres.count
/*Check Empty*/ favoriteGenres.isEmpty
/*Add Item */   favoriteGenres.insert("Jazz")
/*Remove Item*/ favoriteGenres.remove("Rock")
/*Check item*/  favoriteGenres.contains("Funk")


/*Iterating through set */
//1
for genre in favoriteGenres {
    print("\(genre)")
}

//2 (Ordered)
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

/*Set operations  */
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
 
oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]


/* Testing Membership and Equality  */
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
 
houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true




















