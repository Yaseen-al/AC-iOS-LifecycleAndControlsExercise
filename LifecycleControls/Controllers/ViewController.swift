//
//  ViewController.swift
//  LifecycleControls
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    
    var mySongList = [Song]()
    var filteredSongs: [Song]{
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return mySongList
        }
        guard let scopeTitle = self.mySearchBar.scopeButtonTitles else {
            return mySongList
        }
        let selectedIndex = self.mySearchBar.selectedScopeButtonIndex
        let filterignCriteria = scopeTitle[selectedIndex]
        switch filterignCriteria {
        case "Name":
            let filteredlist = mySongList.filter{$0.name.lowercased().contains(searchTerm.lowercased())}
            Settings.numberOfRows = filteredlist.count
            return filteredlist
        case "Artist":
            let filteredList = mySongList.filter{$0.artist.lowercased().contains(searchTerm.lowercased())}
            Settings.numberOfRows = filteredList.count
            return filteredList
        default:
            return mySongList
        }
        
    }
    
    var searchTerm: String?{
        didSet{
            self.myTableView.reloadData()
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search is clicked")
        self.searchTerm = searchBar.text
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    
    
    // I need two method to answer how many rows and how are the cells will look like
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Setting num of rows")
        return  Settings.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personSetup = filteredSongs[indexPath.row]
        guard let cell: UITableViewCell = myTableView.dequeueReusableCell(withIdentifier: "myCell") else {
            let defaultCell = UITableViewCell()
            return defaultCell
        }
        
        cell.textLabel?.text = personSetup.name
        cell.detailTextLabel?.text = personSetup.artist
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(Settings.red), green: CGFloat(Settings.green), blue: CGFloat(Settings.blue), alpha: 1)
        cell.textLabel?.font = UIFont(name: Settings.font, size: 15)
        print(Settings.textCase)
        return cell
    }
//    override func viewWillLayoutSubviews() {
//
//        myTableView.reloadData()
//        print("view Will layout subviews\(Settings.numberOfRows)")
//    }
    override func viewDidLayoutSubviews() {
        // this viewDidLayoutSubviews is when you come back from another view
        myTableView.reloadData()
        print("viewDidAppear layour subview with \(Settings.numberOfRows)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mySongList = Song.loveSongs
        Settings.numberOfRows = mySongList.count
        // Do any additional setup after loading the view, typically from a nib.
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.mySearchBar.delegate = self
        print("viewDidLoad is called and number of rows is \(Settings.numberOfRows)")
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? DetailedTableViewController{
//            let selectedRow = self.myTableView.indexPathForSelectedRow?.row
//            let selectedSong = self.mySongList[selectedRow!]
//            destination.song = selectedSong
//        }
    }
    
}

