//
//  RWTCountryResultsController.swiftf.swift
//  CountryFunFacts
//
//  Created by Ray Wenderlich on 9/5/14.
//  Copyright (c) 2014 Fresh App Factory. All rights reserved.
//

import Foundation

import UIKit

@objc protocol RWTCountryResultsControllerDelegate {
  optional func searchCountrySelected()
}

class RWTCountryResultsController: UITableViewController, UISearchResultsUpdating
 {
  
  var countries = RWTCountry.countries()
  var filteredCountries = NSMutableArray()
  var delegate: RWTCountryResultsControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.separatorStyle = UITableViewCellSeparatorStyle.None

    let nib = UINib(nibName:"RWTCountryTableViewCell",
    bundle:nil)
    tableView.registerNib(nib, forCellReuseIdentifier:"Cell")
  }

  // #pragma mark – Table View
  override func numberOfSectionsInTableView(tableView:
    UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
    
    return filteredCountries.count
  }
  
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 246.0
    }
    
  override func tableView(tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath)
    -> UITableViewCell {
    
    var cell =
    tableView.dequeueReusableCellWithIdentifier("Cell",
    forIndexPath: indexPath) as RWTCountryTableViewCell
    
    let country = filteredCountries[indexPath.row] as RWTCountry
    cell.configureCellForCountry(country)
    cell.selectionStyle = UITableViewCellSelectionStyle.None
    return cell
  }
  
  override func tableView(tableView: UITableView,
    didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    if (delegate?.searchCountrySelected != nil) {
    delegate?.searchCountrySelected!()
    }    
  }


    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if !searchController.active {
            return
        }
        self.filterContentForSearchText(searchController.searchBar.text)
    }
    
  // #pragma mark – Search Helper
  
  func filterContentForSearchText(searchText: String) {
    filteredCountries.removeAllObjects()
    
    let predicate = NSPredicate(format:
    "SELF.countryName contains[c] %@", searchText)
    
    let tempArray =
    self.countries.filteredArrayUsingPredicate(predicate)
    
    filteredCountries = NSMutableArray(array: tempArray)
    
    tableView.reloadData()
  }
  
}