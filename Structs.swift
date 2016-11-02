/*






*/





struct Resolution {
    var width = 0
    var height = 0
}


/*  Instantiation */
let someResolution = Resolution() 
let vga = Resolution(width: 640, height: 480) //All structures have an automatically-generated "memberwise initializer".

//Note: Unlike structures, class instances do not receive a default memberwise initializer.
  

