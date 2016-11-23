/*

You "layout" a constraint! (nice semantics ;) )


Shortcuts:
1. When you take an image, click Cmd+Opt+= to get it to the right size
*2. You can see a preview of any scene in assistant Editor -> @top you see two circles button -> click preview(last option)
(You can add several devices in the preview-screen side by side by clicking + at bottom)
*/


You can click on yellow/red signs in the doc outline for constraint warnings/errors and tada! you get a popup

You can give labels to views in SB in Identity inspector @bottom (IDENTIFIER)
You can also give labels to constrains in the Attrb inspector

You can click 'edit' on constraints for a view in the Size inspector @Bottom


/*  Splash screen title example */
1. Give 
2. Give aspect ratio. Ensures the proportion
Note that horizontal wise and vertical, it is still relative. You can still customizing it by giving values
3. Give t, b, l, t 20px and you see errors! Because it conflicts with aspect ratio (IMPORTANT)
4. Just give >= priority and will set to 20 by default and adjuts if it's not possible i.e if it confilicts with other constraints



/*  Using NSLayoutConstraints on an Image */
let myImage = UIImage(named: "rocketShip")
let rocketShipView = UIImageView(image: myImage)
let imageSize = rockershipView.bounds.size

let aspectRatio = imageSize.width/imageSize.height

let constraint = NSLayoutConstraint(
                 item: rocketShipView, 
                 attribute: NSLayoutAttribute.Width,
                 relatedBy: NSLayoutRelation.Equal,
                 toItem: rocketShipView,
                 attribute: NSLayoutAttribute.Height,
                 multiplier: aspectRatio, 
                 constant: 1.0
)
rocketShipView.addConstraint(constraint)









