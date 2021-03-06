/*



*/

/*  The nil-coalescing operator (a ?? b) */
//following is a ternary operator and a??b is shorthand form of the following code
a != nil ? a! : b //unwraps an optional a if it contains a value, or returns a default value b if a is nil. The expression a is always of an optional type. The expression b must match the type that is stored inside a
//Note: If the value of a is non-nil, the value of b is not evaluated. This is known as short-circuit evaluation.

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
