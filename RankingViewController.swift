//
//  RankingViewController.swift
//  BarabaraGame
//
//  Created by Ryuma Harada on 2019/04/16.
//  Copyright © 2019 Ryuma Harada. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    
    @IBOutlet var rankingLabel1: UILabel! //１位のスコアを表示するラベル
    @IBOutlet var rankingLabel2: UILabe2! //2位のスコアを表示するラベル
    @IBOutlet var rankingLabel3: UILabe3! //3位のスコアを表示するラベル
    
    let defaults: UserDefaults = UserDefaults.standard //スコアの保存をするための変数
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        //"score1"というキーの値を取得して表示
        rankingLabel1.text = String(defaults.integer(forKey: "score1"))
        //"score2"というキーの値を取得して表示
        rankingLabel2.text = String(defaults.integer(forKey: "score2"))
        //"score3"というキーの値を取得して表示
        rankingLabel3.text = String(defaults.integer(forKey: "score3"))
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
