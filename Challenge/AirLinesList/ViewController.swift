//
//  ViewController.swift
//  Challenge
//
//  Created by Nada Ashraf on 10/7/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var airlinesTableView: UITableView!
    private var networkService = NetworkServices()
    private var viewModel : AirLinesViewModel!
   
        
    let btnFloating : UIButton = {
        let floating = UIButton()
        floating.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        return floating
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleView.layer.shadowColor = UIColor.lightGray.cgColor
        titleView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        titleView.layer.shadowOpacity = 0.5
        titleView.layer.shadowRadius = 3.0
        titleView.layer.masksToBounds = false
        airlinesTableView.dataSource = self
        airlinesTableView.delegate = self
        configureFloatingButton()
        btnFloating.addTarget(self, action: #selector(btnAddTapp(sender:)), for: .touchUpInside)
        viewModel = AirLinesViewModel(airlines: networkService)
        self.viewModel.fetchairlines { [weak self] in
            self?.airlinesTableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.airlinesTableView.reloadData()
    }
    @objc func btnAddTapp(sender: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addAirLineViewController = storyboard.instantiateViewController(withIdentifier: "AddAirLineViewController") as! AddAirLineViewController
            addAirLineViewController.modalPresentationStyle = .overCurrentContext
        self.present(addAirLineViewController, animated: true, completion: nil)
        }
        
    func configureFloatingButton(){
        
        btnFloating .backgroundColor = .init(red: 230, green: 0, blue: 0, alpha: 1)
         btnFloating.layer.cornerRadius = btnFloating.frame.size.width/2
        btnFloating.clipsToBounds = true
        airlinesTableView.addSubview(btnFloating)
        btnFloating.translatesAutoresizingMaskIntoConstraints = false
        btnFloating.heightAnchor.constraint(equalToConstant: 64).isActive = true
        btnFloating.widthAnchor.constraint(equalToConstant: 64).isActive = true
        btnFloating.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        btnFloating.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -36).isActive = true
    
    }
}
extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.airLinesArray.count)
        return viewModel.airLinesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AirLineCell = tableView.dequeueReusableCell(withIdentifier:"myCell",
                                                           for: indexPath) as! AirLineCell
        cell.configureCell(airline:
        viewModel.airLinesArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAirLine = viewModel.airLinesArray[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let airLineDetailsViewController = storyboard.instantiateViewController(withIdentifier: "AirLineDetailsViewController") as! AirLineDetailsViewController
            airLineDetailsViewController.modalPresentationStyle = .overCurrentContext
            self.present(airLineDetailsViewController, animated: true, completion: nil)
        if let selectedAirLineId = selectedAirLine.id {
        airLineDetailsViewController.loadAirLineDetails(selectedAirLineId: selectedAirLineId)
        }
    }
}
