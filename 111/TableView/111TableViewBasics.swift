/*
  1. tableView.dequeueReusableCell(withIdentifier:cellId1, for: indexPath) returns a non-optional cell
  2. myCustomTableView.dequeueReusableCell(withIdentifier:cellId1, for: indexPath) returns an optional cell



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
        if cell==nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId1)
        }
        
        //note that textLabel? is optional
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        return cell
    } 
    
