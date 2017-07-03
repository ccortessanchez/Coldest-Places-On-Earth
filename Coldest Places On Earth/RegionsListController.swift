//
//  RegionsListController.swift
//  Coldest Places On Earth
//
//  Created by Malek T. on 12/4/15.
//  Copyright © 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit


protocol RegionsProtocol {
    func loadOverlayForRegionWithLatitude(latitude: Double, andLongitude: Double)
}

class RegionsListController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet var tableView: UITableView!
    
    var regions:[String]!
    var latitudes:[Double]!
    var longitudes:[Double]!
    
    var delegate:RegionsProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        regions = ["Verkhoyansk (Russia)","Fraser, Colo (United States)","Hell (Norway)","Barrow (Alaska)","Oymyakon (Russia)"]
        latitudes = [67.550592,39.944987,63.445171,71.290556,63.464138]
        longitudes = [133.399340,-105.817232,10.905217,-156.788611,142.773727]
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "regionCell")
        cell?.textLabel!.text = regions[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        delegate.loadOverlayForRegionWithLatitude(latitude: latitudes[indexPath.row], andLongitude: longitudes[indexPath.row])
    }
}
