//
//  AlarmViewController.swift
//  SpectraWorkshop-iOS2
//
//  Created by Scotty Shaw on 7/22/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit
import AVFoundation

class AlarmViewController: UIViewController {
    
    var alarmSong: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let dosEquisThemeSong = self.setupAudioPlayerWithFile("DosEquisThemeSong", type:"mp3") {
            self.alarmSong = dosEquisThemeSong
        }
        alarmSong?.numberOfLoops = -1
        alarmSong?.volume = 1
        alarmSong?.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupAudioPlayerWithFile(file: NSString, type: NSString) -> AVAudioPlayer?  {
        
        // Step 1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        // Step 2
        var audioPlayer: AVAudioPlayer?
        
        // Step 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        }
        catch {
            print("Player not available")
        }
        
        // Step 4
        return audioPlayer
    }
}
