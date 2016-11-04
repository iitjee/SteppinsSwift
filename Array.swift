/*


*/


/*  Creating Empty Array  */
var someInts = [Int]()

/*  Creating New Array  */
let someArray: Array<String> = ["Alex", "Brian", "Dave"]
let someArray: [String] = ["Alex", "Brian", "Dave"]
var shoppingList = ["Eggs", "Milk"] //since all are of same type, implicit type inference can be done


/*  Creating an Array with a Default Value  */
var threeDoubles = Array(repeating: 0.0, count: 3)

/*  Joining two arrays  */
var sixDoubles = threeDoubles + anotherThreeDoubles

/* Length of Array  */  shoppingList.count
/* Check emptyness  */  shoppingList.isEmpty
/*Add new item  */      shoppingList.append("Flour")  /*or*/  shoppingList += ["Baking Powder"]

/* Changing existing value  */  
shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas", "Apples"]

/*Insert New item  */
shoppingList.insert("Maple Syrup", at: 0)
/*  Removing an item  */
let mapleSyrup = shoppingList.remove(at: 0) //array elements are readjusted to avoid any holes
let apples = shoppingList.removeLast()


/*Iterating over array using for-in */
for item in shoppingList {
    print(item)
}
for (index, value) in shoppingList.enumerated() {   //If you need the integer index of each item as well as its value(the enumerated() method returns a tuple composed of an integer and the item.)
    print("Item \(index + 1): \(value)")    //The integers start at zero and count up by one for each item
}

/*Iterating over array using for */
for i in 0..<shoppingList.count {
    print(shoppingList[i])
}

for var i=0; i<shoppingList.count; ++i {    //very old style
    print(shoppingList[i])
}






