/*

https://www.raywenderlich.com/129059/self-sizing-table-view-cells
Follow the tut, it's quite easy.


A few ins-and-outs aside, all you really have to do is:
- Use Auto Layout when creating your table view cells.
- Set the table view rowHeight to UITableViewAutomaticDimension.
- Set the estimatedRowHeight or implement the height estimation delegate method.




*/

/* Things to remember:

Shift-Click both the image view and the name label and choose Horizontal Centers from the Align Menu
You can fix this by adjusting a couple constraints. In Main.storyboard select the Name label and create another constraint from its bottom end to the bottom margin of the cell. Now select that constraint from the Document Outline and change its Relation to Greater Than or Equal:
Center the label by choosing Horizontally in Container in the Align menu.

^ This you probably don't expect

Even in the final app, the images in detail vc are a bit shaking when expanded. Don't worry
*/
