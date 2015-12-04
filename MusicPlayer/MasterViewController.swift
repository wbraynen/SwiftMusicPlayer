//
//  MasterViewController.swift
//  MusicPlayer2
//
//  Created by William Braynen on 12/2/15.
//  Copyright © 2015 Will Braynen. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var managedObjectContext: NSManagedObjectContext? = nil

    var catalog: Catalog
    
    required init?(coder aDecoder: NSCoder) {
        self.catalog = Catalog()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        self.view.backgroundColor = UIColor.blackColor() //"#145b7c"
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailController = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                
                detailController.album = self.catalog.albums[indexPath.row];
                
                detailController.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                detailController.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.catalog.totalAlbums
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MasterCell = tableView.dequeueReusableCellWithIdentifier("MasterCell_ReuseID", forIndexPath: indexPath) as! MasterCell
//        self.configureCell(cell, atIndexPath: indexPath)

        let album = self.catalog.albums[indexPath.row]
        cell.littleTextLabel.text = album.title
        cell.bigTextLabel.text = album.year
        cell.imageview.image = UIImage( named: album.filenameFor375image ) // TODO: this should really read `filenameFor100image`

        return cell
    }

}

