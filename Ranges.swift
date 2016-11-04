/*


*/

1...5 //1, 2, 3, 4, 5
1..<5 //1, 2, 3, 4

//above ones are `CountableClosedRange` which DOES conform to `Sequence`



"a"..."d" //a, d (no intermediate values)
UnicodeScalar("a").value...UnicodeScalar("d").value //97, 98, 99, 100 (get the difference?)


"vikhyath"..."viki" //only "vikhyath" and "viki"
