//
//  AddAirLineViewController.swift
//  Challenge
//
//  Created by Nada Ashraf on 10/9/21.
//

import UIKit
class AddAirLineViewController : UIViewController{
    
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var headquarters: UITextField!
    @IBOutlet weak var canceltxt: UITextField!
    @IBOutlet weak var slogan: UITextField!
    @IBOutlet weak var name: UITextField!
    
    
    private var networkService = NetworkServices()
    private var viewModel : AirLinesViewModel!
    
    override func viewDidLoad() {
        viewModel = AirLinesViewModel(airlines: networkService)
    }
  
    @IBAction func confirmBtn(_ sender: UIButton) {
        let airline = AirLineModel(id: 0.0, name: name.text, country: country.text, logo: "", slogan: slogan.text, head_quaters: headquarters.text, website: "", established: "")
        viewModel.airLinesArray.insert(airline, at: 0)
        self.dismiss(animated: true, completion: nil)
      
    }
    @IBAction func cancelBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

    }
}

