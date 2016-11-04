/*
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html

1. Even for single if statement, you've to put braces
2. Switch statements doesn't suffer from fallthrough
3. It's mandatory to put a default case in Switch statements to make sure it's exhaustive.

*/


/*  for */
for _ in 1..5 { //_ is called wildcard
  print("Hello")
}

/*  repeat-while  */
repeat {


} while condition

/*  Labeled Statements  */
//Loops and conditional statements can both use the 'break' to end their execution prematurely. (whereas 'continue' only for loops)
//Therefore, it is sometimes useful to be explicit about which loop or conditional statement you want a break statement to terminate.
//(or 'continue' for loops)

myLabel: while somecondition {
  if otherCondition {continue myLabel}
  if someOtherCondition {break myLabel}
}

outerLabel: if someCondition {
  innerLabel: if otherCondition {
    if someAnotherCondition {break outerLabel}
    if yetAnotherCondition {break innerLabel}
  }
}

/* Switch-Case statement  */
let someItem: Character = "w"

switch someItem {
    case "a", "e", "i", "o", "u":
        print("Letter is vowel")
    
    case "a"..."z":
        print("Letter is consonant")
        
    default:
        print("It's not an alphabet")
}
//Note that there is no `break` in cases. Also, one can use the keyword `fallthrough` if you need that behavior

let someItem: Character = "w"

switch someItem {
    case "a", "e", "i", "o", "u":
        print("Letter is vowel")
    
    case "a"..."z":
        fallthrough
  
    default:
        print("Letter is a consonant")
}



















