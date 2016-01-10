//
//  SwiftViewController.swift
//  ExpandingTableCell
//
//  Created by Michael MacCallum on 1/10/16.
//  Copyright © 2016 HappTech Development. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.allowsMultipleSelection = true
    }
}

extension SwiftViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if let selectedIndexPaths = tableView.indexPathsForSelectedRows where selectedIndexPaths.contains(indexPath) {
            return 100.0 // Expanded height
        }

        return 44.0 // Normal height
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SwiftCell", forIndexPath: indexPath)

        cell.textLabel?.text = "row \(indexPath.row)"
        cell.detailTextLabel?.text = "section \(indexPath.section)"

        return cell
    }
}

extension SwiftViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        updateTableView()
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        updateTableView()
    }

    private func updateTableView() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
