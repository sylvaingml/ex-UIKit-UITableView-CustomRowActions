//
//  StaticTable.swift
//  SwipeActions
//
//  Created by Sylvain Gamel on 07/02/2015.
//

import UIKit

/** Controller for the main view of this sample app.

Merge table view controller, table data source and table delegate in
a single object.

This illustrate how you can build your own actions for a table view row.

- viewDidLoad() defines the actions

*/
class StaticTable: UITableViewController
{
    // MARK: Actions for cells
    
    /** Our array of actions for cells. */
    var rowActions = [UITableViewRowAction]()

    
    
    // MARK: View init
    
    
    
    /** View is loaded. Please initialize.
    */
    override internal func viewDidLoad()
    {
        // Build a list of actions for cells
        
        var blueAction = UITableViewRowAction(style: .Normal, title: "Blue", handler: {
            (action, indexPath) in
            NSLog("Perform action \( action.title )")
        })
        
        blueAction.backgroundColor = UIColor.blueColor()
        
        
        var redAction = UITableViewRowAction(style: .Normal, title: "Red", handler: {
            (action, indexPath) in
            NSLog("Perform action \( action.title )")
        })
        
        redAction.backgroundColor = UIColor.redColor()

        rowActions.append(blueAction)
        rowActions.append(redAction)
    }
    
    
    
    // MARK: - Implementing UITableViewDataSource
    
    
    
    /** How many sections in this table?
    */
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    
    /** How many rows in section?
    
    Cells are static and fake data generated on the fly. 
    No specific values to be used.
    
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 120
    }
    
    
    
    /** Provide a cell to render as a row.
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("staticCell") as UITableViewCell
        
        cell.textLabel?.text = "Cell for row \( indexPath.row )"
        
        return cell
    }
    
    
    /** Some action was selected in the edition action cells.
    */
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("Commit action \( editingStyle ) on row \( indexPath.row )")
    }
    
    // MARK: - Implementing UITableViewDelegate
    
    
    /** Main method to build/provide row specific actions.
    
    This is the method to implement to provide our own custom actions.
    (in our case those were built after view is loaded.)
    
    */
    override func tableView(
        tableView: UITableView,
        editActionsForRowAtIndexPath indexPath: NSIndexPath
        ) -> [AnyObject]?
    {
        return rowActions
    }
    
    
    
    /** Some row have been selected. 

    Just unselect it.

    */
    override func tableView(
        tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath
        )
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
