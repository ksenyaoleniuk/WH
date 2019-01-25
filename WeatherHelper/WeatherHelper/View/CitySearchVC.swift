//
//  CitySearchVC.swift
//  WeatherHelper
//
//  Created by Vladyslav Zhulavskyi on 1/23/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class CitySearchVC: UIViewController {
    //MARK: -Properties
    var cityController = CitiesController()
    var recommendationController = RecommendationController()
    //MARK: IBoutlets
    
    @IBOutlet weak var citiesTableView: UITableView!
    
    @IBOutlet weak var chooseCityLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        
        citiesTableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
        cityController.startJSON(string: "https://api.darksky.net/forecast/50ce78d1b344d3268b80456020b02d53/42.3601,-71.0589?exclude=daily&lang=uk")
    }
}
extension CitySearchVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityController.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCity = cityController.cities[indexPath.row]
        
        let cell = citiesTableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        
        cell.cityName.text = currentCity
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "nextView", sender: self)
    }
}
