//
//  ViewController.swift
//  shakeSoundDemo
//
//  Created by fskkp on 18/12/2015.
//  Copyright © 2015 maz masz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer = AVAudioPlayer()
    
    //IBOutlet
    @IBOutlet weak var myLabel: UILabel!
  
    //IBAction
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        myLabel.text = "It's Shaking!!"
        
        do {
            try playSound("shakesound", fileExtension: "wav")
        }
        catch {
            return
        }
        
        
    }//end of func motionBegan
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playSound(fileName:String, fileExtension: String) throws {
        
        let dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(dispatchQueue, { let mainBundle = NSBundle.mainBundle()
            
            let filePath = mainBundle.pathForResource("\(fileName)", ofType: "\(fileExtension)")
            
            if let path = filePath{
                let fileData = NSData(contentsOfFile: path)
                do  {
                    //start the audio player
                    self.audioPlayer = try AVAudioPlayer(data: fileData!)
                    
                    guard let player : AVAudioPlayer? = self.audioPlayer else {
                        return
                        
                    } // end of guard let
                    
                    // set the delegate and start playing
                    
                    player!.delegate = self
                    
                    if player!.prepareToPlay() && player!.play() {
                        //successfully started playing
                        
                        
                        
                        
                        
                        
                    }else {
                        //failed to play
                        
                        
                        
                        
                        
                    
                        
                    }
                }//end of do
                catch {
                    return
                }
                
            }//end of let path
            
            
        })//end of dispatch async
        
    }//end of func playsound


}

