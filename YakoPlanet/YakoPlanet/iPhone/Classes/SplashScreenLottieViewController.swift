//
//  SplashScreenLottieViewController.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 4/05/23.
//

import UIKit
import Lottie

class SplashScreenLottieViewController: UIViewController {

    @IBOutlet weak var imageLottie: LottieAnimationView!
    let animationView = LottieAnimationView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        showAnimation()
    }

    func showAnimation(){
        imageLottie.contentMode = .scaleAspectFit
        imageLottie.loopMode    = .loop
        imageLottie.play()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(showMoviesVC), userInfo: nil, repeats: false)
    }
    
    @objc func showMoviesVC(){
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }

}
