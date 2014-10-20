//
//  RWTCountryPopoverViewController.swift
//  CountryFunFacts
//
//  Created by Ray Wenderlich on 9/4/14.
//  Copyright (c) 2014 Fresh App Factory. All rights reserved.
//

//
//  RWTCountryPopoverViewController.swift
//  CountryFunFacts
//
//  Created by Nick Waynik on 8/22/14.
//  Copyright (c) 2014 Fresh App Factory. All rights reserved.
//

import UIKit

class RWTCountryPopoverViewController: UIViewController {
  
  @IBOutlet var countryNameLabel: UILabel!
  @IBOutlet var languageLabel: UILabel!
  @IBOutlet var populationLabel: UILabel!
  @IBOutlet var currencyLabel: UILabel!
  @IBOutlet var factsTextView: UITextView!
  
  var country: RWTCountry?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.addCloseButton()
  }
  
  override func viewWillAppear(animated: Bool)  {
    super.viewWillAppear(animated)
    
    self.configureView()
  }
  
  func addCloseButton() {
    var detailsButton: UIBarButtonItem =
    UIBarButtonItem(title: "Close",
      style: UIBarButtonItemStyle.Plain,
      target: self, action: "close:")
    
    self.navigationItem.rightBarButtonItem = detailsButton
  }
  
  func configureView() {
    if country != nil {
      countryNameLabel.text = country!.countryName
      languageLabel.text = country!.language
      populationLabel.text = country!.population
      currencyLabel.text = country!.currency
      factsTextView.text = country!.fact
    }
  }
  
  func close(sender: UIBarButtonItem) {
    dismissViewControllerAnimated(true, completion: nil)
  }
}

