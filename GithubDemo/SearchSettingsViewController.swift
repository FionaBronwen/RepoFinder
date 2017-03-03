//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Fiona Thompson on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {


    @IBOutlet weak var starSlider: UISlider!
    
    @IBOutlet weak var minStarLabel: UILabel!
    weak var delegate: SettingsPresentingViewControllerDelegate?
    var searchSettings: GithubRepoSearchSettings?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starSlider.value = Float((searchSettings?.minStars)!)
        minStarLabel.text = "\(Int(starSlider.value))"
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSave(_ sender: Any) {
        //searchSettings?.minStars = Int(starSlider.value)
        self.delegate?.didSaveSettings(settings: searchSettings!)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onCancel(_ sender: Any) {
        self.delegate?.didCancelSettings()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onSlide(_ sender: Any) {
        let minStarInt = (Int(starSlider.value))
        minStarLabel.text = "\(minStarInt)"
        searchSettings?.minStars = Int(starSlider.value)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
