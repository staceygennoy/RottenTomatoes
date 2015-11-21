//
//  ViewController.swift
//  RottenTomatoes
//
//  Created by Stacey Gennoy on 11/19/15.
//  Copyright © 2015 Stacey Gennoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var movieTitles: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        movieTitles = ["The Hobbit", "Catching Fire"]
        
        print(movieTitles[0])
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us")!
        
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (respons: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            
            let dictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options:[])
            
            print(dictionary)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTitles.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as! MovieCell
        
        let movieTitle = movieTitles[indexPath.row]
        
        cell.titleLabel.text = movieTitle
        cell.synopsisLabel.text = "the synopsis label"
        
        print(indexPath.row)
        
        return cell
    
    
    }

}

