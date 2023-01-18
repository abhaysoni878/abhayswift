//
//  WatchViewController.swift
//  AbhaySoni
//
//  Created by bizbrolly on 13/01/22.
//

import UIKit
class WatchViewController: UIViewController , UITableViewDelegate {

    //MARK: variable
    
    let mainstopwatch : Stopwatch = Stopwatch()
    @objc let lapstopwatch : Stopwatch = Stopwatch()
    var laps: [String] = []
    var isplay : Bool = false

    
    //MARK: outlets
    @IBOutlet weak var totaltime: UILabel!
    @IBOutlet weak var laplevel: UILabel!
    @IBOutlet weak var lapbutton: UIButton!
    @IBOutlet weak var startbutton: UIButton!
    @IBOutlet weak var laptableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let initCircleButton: (UIButton) -> Void = { button in
              button.layer.cornerRadius = 0.5 * button.bounds.size.width
              button.backgroundColor = UIColor.white
            }
            
            initCircleButton(startbutton)
            initCircleButton(lapbutton)
        
        laptableview.delegate = self;
        laptableview.dataSource = self;
        lapbutton.isEnabled = false
      
        //MARK: - api integration
        let url = URL(string: "https://shibe.online/api/shibes?count=10&urls=true&httpsUrls=true")!
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response , error ) in
            if error != nil {
                print(error)
            }
            else{
                guard let content = data else {
                    print("No Data" )
                    return
                }
                
                guard let jsondata = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers
                )) as? [ String ] else {
                    print("No Data......")
                    return
                }
                print(jsondata)
            }
        }
        task.resume()
    }
    //MARK: actions
    @IBAction func startbutton(_ sender: AnyObject) {
        lapbutton.isEnabled = true
        changeButton(lapbutton , title: "Lap" , titleColor: UIColor.black)
        if !isplay {
            mainstopwatch.timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(UpdateMainTimer), userInfo: nil, repeats: true)
            lapstopwatch.timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(UpdateLapTimer), userInfo: nil, repeats: true)
            
            RunLoop.current.add(mainstopwatch.timer, forMode: RunLoop.Mode.common)
            RunLoop.current.add(lapstopwatch.timer, forMode: RunLoop.Mode.common)
            isplay = true
            changeButton(startbutton, title: "Stop", titleColor: UIColor.red)
        }
        else {
            mainstopwatch.timer.invalidate()
            lapstopwatch.timer.invalidate()
            isplay = false
            changeButton(startbutton, title: "Start", titleColor: UIColor.green)
            changeButton(lapbutton, title: "Reset", titleColor: UIColor.black)
        }
        
    }
    @IBAction func lapbutton(_ sender: AnyObject) {
        
        if !isplay {
            resetMainTimer()
            resetLapTimer()
            changeButton(lapbutton, title: "Lap", titleColor: UIColor.lightGray)
            lapbutton.isEnabled = false
        } else {
            if let timerLabelText = totaltime.text {
                laps.append(timerLabelText)
            }
            laptableview.reloadData()
            resetLapTimer()
            lapstopwatch.timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(UpdateLapTimer), userInfo: nil, repeats: true)
            RunLoop.current.add(lapstopwatch.timer, forMode: RunLoop.Mode.common)
        }
    }

    
    
    
    //MARK: Two main function------------------------------------------------
    @objc func resetTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.timer.invalidate()
        stopwatch.couter = 0.0
        label.text =  "00:00:00"
    }
    func resetMainTimer() {
        resetTimer(mainstopwatch, label: totaltime)
        laps.removeAll()
        laptableview.reloadData()
    }
    @objc func resetLapTimer() {
        resetTimer(lapstopwatch, label: laplevel)
    }
    
    @objc func UpdateMainTimer() {
        abhay(mainstopwatch, label: totaltime)
    }
    @objc func UpdateLapTimer() {
        abhay(lapstopwatch, label: laplevel)
    }
    @objc func abhay(_ stopwatch: Stopwatch , label : UILabel) {
        stopwatch.couter = stopwatch.couter + 0.5
        var minutes : String = " \((Int)(stopwatch.couter / 60))"
        if (Int)(stopwatch.couter/60 ) < 10 {
            minutes = "0\((Int)(stopwatch.couter/60))"
        }
        var seconds: String = String(format: "%.2f", (stopwatch.couter.truncatingRemainder(dividingBy: 60)))
        if stopwatch.couter.truncatingRemainder(dividingBy: 60) < 10 {
              seconds = "0" + seconds
            }
            
            label.text = minutes + ":" + seconds
        
    }
    //MARK: lap funtion
    fileprivate func changeButton(_ button: UIButton, title: String, titleColor: UIColor) {
        button.setTitle(title, for: UIControl.State())
        button.setTitleColor(titleColor, for: UIControl.State())
    }
}
extension WatchViewController:   UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elapsedtime = laps[indexPath.row]
        let  identifier: String = "lapCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as!  StopWatchTableViewCell
        
        print("Lap \(laps.count - (indexPath as NSIndexPath).row)")
        cell.label1.text = "Lap \(laps.count - (indexPath as NSIndexPath).row)"
        cell.label2.text = laps[laps.count - (indexPath as NSIndexPath).row - 1]
        print(laps[laps.count - (indexPath as NSIndexPath).row - 1])
//        if let labelNum = cell.viewWithTag(5) as? UILabel {
//            labelNum.text = "Lap \(laps.count - (indexPath as NSIndexPath).row)"
//        }
//        if let labelTimer = cell.viewWithTag(5) as? UILabel {
//            labelTimer.text = laps[laps.count - (indexPath as NSIndexPath).row - 1]
//        }
////        let elapsedTimeString = String(format: "%.4f", elapsedtime)
//                cell.textLabel?.text = "\(elapsedTimeString)"
//
        return cell
    }
}

