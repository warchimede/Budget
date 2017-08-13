//
//  UIViewController+Ad.swift
//  Budget
//
//  Created by William Archimède on 13/08/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAdBannerView()
    }

    // MARK: - Admob

    @IBOutlet weak var adBannerView: GADBannerView!

    private func setupAdBannerView() {
        adBannerView.rootViewController = self
        adBannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111" // Test
        //        adBannerView.adUnitID = "ca-app-pub-7814673314543067/2788088095" // Prod
        adBannerView.load(GADRequest())
    }
}
