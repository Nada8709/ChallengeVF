//
//  AirLineDetailsViewController.swift
//  Challenge
//
//  Created by Nada Ashraf on 10/9/21.
//

import UIKit

class AirLineDetailsViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var slogan: UILabel!
    @IBOutlet weak var head_quaters: UILabel!
    @IBOutlet weak var detailsView: UIView!
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var titleView: UIView!
    private var viewModel : AirLineDetailsViewModel!
    private var airLineDetailsService = AirLineDetailsService()
    @IBAction func visitBtn(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        titleView.layer.shadowColor = UIColor.lightGray.cgColor
        titleView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        titleView.layer.shadowOpacity = 0.5
        titleView.layer.shadowRadius = 3.0
        titleView.layer.masksToBounds = false
        viewModel = AirLineDetailsViewModel(airLineDetailsService: airLineDetailsService)
        
    }
    func loadAirLineDetails(selectedAirLineId: Double){
        viewModel.fetchAirLineDetailsfromNetwork(airLineId: selectedAirLineId) {
            [weak self] in
            self?.configInputs()
            
        }
    }
    private func configInputs() {
        if let selectedAirLine = viewModel.selectedAirLine{
            name.text = selectedAirLine.name ?? ""
            country.text = selectedAirLine.country ?? ""
            slogan.text = selectedAirLine.slogan ?? ""
            head_quaters.text = selectedAirLine.head_quaters ?? ""
        }
    }
}
