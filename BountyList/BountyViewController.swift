//
//  BountyViewController.swift
//  BountyList
//
//  Created by 김선재 on 2022/01/20.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MVVM
    
    //Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View
    // - ListCell
    // > ListCell 필요한 정보를 ViewModel 한테서 받아야겠다.
    // > ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 하기
    
    // Viewmodel
    // - BountyViewModel
    // > BountyViewModel 을 만들고, 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기,, BountyInfo 등
    
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
//    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
//    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
//
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 세그웨이 넘어가기 전 준비하는 세션, 데이터 넘겨줌.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 에게 데이터 줌.
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            
            if let index = sender as? Int {
                let bountyInfo = bountyInfoList[index]
                
                vc?.bountyInfo = bountyInfo
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
            }
        }
        
    }
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        let bountyInfo = bountyInfoList[indexPath.row]
        let img = UIImage(named: "\(bountyInfo.name).jpg")
        cell.imgView.image = img
        cell.nameLable.text = bountyInfo.name
        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        return cell
    }
    // UItableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }

}

// custom cell
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name:String, bounty:Int) {
        self.name = name
        self.bounty = bounty
    }
}
