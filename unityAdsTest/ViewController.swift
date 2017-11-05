//
//  ViewController.swift
//  unityAdsTest
//
//  Created by Roman on 11/5/17.
//  Copyright © 2017 Roman Rudavskiy. All rights reserved.
//

import UIKit
import UnityAds

class ViewController: UIViewController, UnityAdsDelegate {
    @IBOutlet weak var coinLbl: UILabel!
    @IBOutlet weak var watchVideoBtn: UIButton!
    
    var coins: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Init
        UnityAds.initialize("1597356", delegate: self)
        
        watchVideoBtn.isHidden = true
        coinLbl.text = String(coins)
        
    }
    
    //UnityAds implementation
    func unityAdsReady(_ placementId: String) {
        print("UnityAd Video is READY!")
        watchVideoBtn.isHidden = false
    }
    
    func unityAdsDidStart(_ placementId: String) {
        print("UnityAd Video is LAUNCHED!")
        
    }
    
    func unityAdsDidError(_ error: UnityAdsError, withMessage message: String) {
        print("Error! UnityAd is FAILED!")
    }
    
    func loadAndShowUnityAd() {
        let placement = "rewardedVideo"
        if (UnityAds.isReady(placement)) {
            //a video is ready & placement is valid
            UnityAds.show(self, placementId: placement)
        }
    }
    
    func unityAdsDidFinish(_ placementId: String, with state: UnityAdsFinishState) {
        if (state != .skipped) {
            //reward the player
            coins += 5
            coinLbl.text = String(coins)
        }
    }
    @IBAction func watchVideoBtnPressed(_ sender: Any) {
        loadAndShowUnityAd()
        
    }
    
}

