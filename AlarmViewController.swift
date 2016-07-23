//
//  AlarmViewController.swift
//  SpectraWorkshop-iOS2
//
//  Created by Scotty Shaw on 7/22/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit
import AVFoundation
import TwitterKit

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
        
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                let alert = UIAlertController(title: "Logged In",
                    message: "User \(unwrappedSession.userName) has logged in",
                    preferredStyle: UIAlertControllerStyle.Alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        
        // TODO: Change where the log in button is positioned in your view
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
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
