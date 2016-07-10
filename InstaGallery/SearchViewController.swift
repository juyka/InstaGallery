//
//  ViewController.swift
//  InstaGallery
//
//  Created by Анастасия Васюра on 10/07/16.
//  Copyright © 2016 Анастасия Васюра. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    let viewModel = SearchViewModel()

    @IBOutlet weak var searchTermTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapSearchButton(sender: UIButton) {
        let term = searchTermTextField.text ?? ""
        viewModel.search(term) { (users, error) in
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showGallerySegue" {
            if let viewController = segue.destinationViewController as? GalleryViewController, let indexPath = sender as? NSIndexPath {
                let user = viewModel.users[indexPath.row]
                let galleryViewModel = GalleryViewModel(user: user)
                viewController.viewModel = galleryViewModel
            }
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let user = viewModel.users[indexPath.row]
        cell.textLabel?.text = user.name
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("showGallerySegue", sender: indexPath)
    }
}



