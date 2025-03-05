//
//  MainTabBarController.swift
//  Lecture0305Ex03
//
//  Created by 심근웅 on 3/5/25.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.delegate = self
    
    let homeVC = HomeViewController()
    let settingsVC = SettingsViewController()
    let profileVC = ProfileViewController()
    
    homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
    settingsVC.tabBarItem = UITabBarItem(title: "설정", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
    profileVC.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
    
    self.tabBar.tintColor = UIColor.brown
    
    self.viewControllers = [homeVC, settingsVC, profileVC]
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}

extension MainTabBarController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    guard let selectedView = viewController.view else { return }
    selectedView.alpha = 0
    UIView.animate(withDuration: 0.3) {
      selectedView.alpha = 1
    }
  }
}
