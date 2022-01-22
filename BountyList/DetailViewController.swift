//
//  DetailViewController.swift
//  BountyList
//
//  Created by 김선재 on 2022/01/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MVVM
    
    //Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View
    // - imgView, nameLabel, bountylabel
    // > view들은 viewModel를 통해서 구성되기 ? 
    
    // Viewmodel
    // - DetailViewModel
    // > 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기,, BountyInfo 등
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
//    var name: String?
//    var bounty: Int?

    var bountyInfo: BountyInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if let bountyInfo = self.bountyInfo {
            // let img = UIImage(named: "\(bountyInfo.name).jpg")
            imgView.image = bountyInfo.image
            nameLable.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
        
//        if let name = self.name, let bounty = self.bounty {
//            let img = UIImage(named: "\(name).jpg")
//            imgView.image = img
//            nameLable.text = name
//            bountyLabel.text = "\(bounty)"
            
//       }
        
    }
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
