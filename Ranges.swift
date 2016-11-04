/*


*/

1...5 //1, 2, 3, 4, 5
1..<5 //1, 2, 3, 4

//above ones are `CountableClosedRange` which DOES conform to `Sequence`



"a"..."d" //all values between and including a and d. However, you can't use directly in a for-in statement
UnicodeScalar("a").value...UnicodeScalar("d").value //97, 98, 99, 100 (get the difference?)
UnicodeScalar(98) //"b"

"vikhyath"..."viki" 
