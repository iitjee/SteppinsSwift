/*
  1. tableView.dequeueReusableCell(withIdentifier:cellId1, for: indexPath) returns a non-optional cell
  2. myCustomTableView.dequeueReusableCell(withIdentifier:cellId1, for: indexPath) returns an optional cell


  0. If you've textview, make sure you uncheck User Interaction Enabled, which will allow touches to pass through the text view and trigger a selection of the cell itself.
*/


//0 Connect datasource and delegate

    class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {}


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId1 = "<#CellId1#>"
        let cell = tableView.dequeueReusableCell(withIdentifier:cellId1, for: indexPath)
        
        //note that textLabel? because it can have no text!
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        return cell
    } 
    
/*or*/  //if cellId is not given in Storyboard but you want to give from code
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId1 = "<#CellId1#>"
        var cell = tableView.dequeueReusableCell(withIdentifier:cellId1, for: indexPath)
      
      //(var cell = tableView.dequeueReusableCell(withIdentifier:cellId1, for: indexPath) as! MyCustomTableViewCell )
      
        if cell==nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId1)
        }
        
        //note that textLabel? is optional
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        return cell
    } 
    
/*  or  */
class ArtistDetailViewController: UIViewController {
  //...
}

extension ArtistDetailViewController: UITableViewDataSource {
  //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
}

extension ArtistDetailViewController: UITableViewDelegate {
  //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

}
