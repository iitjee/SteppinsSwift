/*  So the tuple, in other words is a list of two or more things, they don't have to be the same types, surrounding by parentheses. 

The tuple is treated as a single variable or constant, so in this case http404Error is going to point at the single tuple, not at either of the components of the tuple.

It's as if I had a struct that had two fields in it, 
but the struct is effectively created implicitly by the compiler.

Now having initialized the variable, I can access the fields if I want to.    




*/


let http404Error = (404, "Not Found")
http404Error.0  //404
http404Error.1  //"Not Found"

let (status, desc) = http404Error
status  //404
desc  //Not Found
//Note: Both status and desc are now constants

let http404Error = (status: 404, desc: "Not Found")
http404Error.status  //404
http404Error.desc  //"Not Found"

/*  Ignoring some fields  */
let (status, _) = (404, "Not Found")
//Here we use the wildcard character _ to ignore few fields

/* Tuples as Return types of Functions  */
func fetch() -> (code: Int, desc: String) {
  return (200, "Okay")
  }
  
  //using default names for decomposing tuple (which were given in the function declaration 
  let status = fetch()
  status.code //(or) status.0
  status.desc //(or) status.1
  
  //If you want to provide your own names for the fields inside the tuple
  let (error, description) = fetch()
  error //
  description //

  //Another way
  let tempstatus = fetch()
  let status = (errorCode: tempstatus.0, descrip: tempstatus.1)
//(or)   let status = (errorCode: fetch().0, descrip: fetch().1) //if function calls are not too expensive
  status.errorCode
  status.descrip
  
  
/*  Tuple Types */
var someTuple = (top: 10, bottom: 12)  // someTuple is of type (top: Int, bottom: Int)
someTuple = (top: 4, bottom: 42) // OK: names match
someTuple = (9, 99)              // OK: names are inferred
someTuple = (left: 5, right: 5)  // Error: names don't match

//Note: A single parenthesized type is the same as that type without parentheses. For example, (Int) is equivalent to Int.



/* Tuples are equivalent to a Class */
//once watch video


  
  
 

  
  
