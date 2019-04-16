//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by Ryuma Harada on 2019/04/16.
//  Copyright © 2019 Ryuma Harada. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imgView1: UIImageView! //上の画像
    @IBOutlet var imgView2: UIImageView! //真ん中の画像
    @IBOutlet var imgView3: UIImageView! //下の画像
    
    @IBOutlet var resultLabel: UILabel!
    
    var timer: Timer! //画像を動かすためのタイマー
    var score: Int = 1000 //スコアの値
    let defaults: UserDefaults = UserDefaults.standard
    
    let width: CGFloat = UIScreen.main.bounds.size.width //画面幅
    
    var positionX: [CGFloat] = [0.0, 0.0, 0.0] //画像の位置の配列
    
    var dx: [CGFloat] = [1.0, 0.5, -1.0] //画像の動かす幅の配列
    
    func start () {
        //結果ラベルを見えなくする
        resultLabel.isHidden = true
        
        //タイマーを動かす
        timer = Timer.scheduledTimer (withTimeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        
        timer.fire()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2, width/2, width/2] //画像の位置を画面幅の中心にする
        self.start() //前ページで書いたstartというメソッドを呼び出す
        
        func up() {
            for i in 0..<3 {
                //端に来たら動かす向きを逆にする
                if positionX[i] > width || positionX[i] < 0 {
                    dx[i] = dx[i] * (-1)
                }
            position[i] += dx[i] //画像の位置をdx分ずらす
            }
            imgView1.center.x = positionX[0] //上の画像をずらした位置に移動させる
            imgView2.center.x = position[1] //真ん中の画像をずらした位置に移動させる
        }
        
        @IBAction func stop () {
            if timer.isValid == true { //もしタイマーが動いていたら
                timer.invalidate() //タイマーを止める（無効にする）
            }
        }
        
        
        @IBAction func stop () {
            for i in 0..<3 {
                score = score - abs(Int(width/2 - positionX[i])) * 2 //スコアの計算をする
            }
            resultLabel.text = "Score : " + String(score) //結果ラベルにスコアを表示する
            resultLabel.isHidden = false //結果ラベルを隠さない（表す）
            
            let highScore1: Int = defaults.intenger(forKey: "score1") //ユーザーデフォルトに"score1"というキーの値を取得
            let highScore2: Int = defaults.intenger(forKey: "score2") //"score2"というキーの値を取得
            let highScore3: Int = defaults.intenger(forKey: "score3") //"score3"というキーの値を取得
       
            if score > highScore1 { //ランキング１位の記録を更新したら
                defaults.set(score, forKey: "score1") //"score１"というキーでscoreを保存
                defaults.set(highScore1, forKey: "score2") //"score2"というキーでhighscore1(元１位の記録）を保存
                defaults.set(highScore2, forKey: "score3") //"score2"というキーでhighscore2(元2位の記録）を保存
            } else if score > highScore2 {//ランキング２位の記録を更新したら
                defaults.set(highScore2, forKey: "score3") //保存しないだけで、score3はちゃんと消えてくれるのか？
            } else if score > highscore3 { //ランキング３位の記録を更新したら
                defaults.set(score, forKey: "score3")
            }
            defaults.synchronize()
        }
        
        @IBAction func retry () {
            score = 1000 //スコアの値をリセットする
            positionX = [width/2, width/2, width/2] //画像の位置を真ん中に戻す
            if timer.isValid == false {
                self.start() //スタートメソッドを呼び出す
            }
            
            @IBAction func toTop () {
                self.dismiss (animated: true, completion: nil)
            }
            
            let defaults: UserDefaults = UserDefaults.standard
            defaults.integer(forkey: "キー")
        }
        
        

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
