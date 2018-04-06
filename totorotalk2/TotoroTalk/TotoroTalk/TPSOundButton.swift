//
//  TPSOundButton.swift
//  TotoroTalk
//
//  Created by Li Shuzu on 6/04/18.
//  Copyright © 2018 TimePic. All rights reserved.
//

import UIKit
import AVFoundation

@IBDesignable class TPSOundButton: UIStackView, AVAudioPlayerDelegate{
//MARK: Properties
    @IBInspectable var ButtonSize: CGSize = CGSize(width: 100.0, height: 100.0) {
        didSet {
            setupButtons()
        }
    }
    //MARK: Properties
    var player: AVAudioPlayer?
    let playButton = UIButton()
    let soundLabel = UILabel()
    var isPlay = false;
    var labelText  = "";
    
    
    let soundList = [BaseConstants.tags.UIButton_call_partner: "call_partner_010",
                     BaseConstants.tags.UIButton_contact: "contact_008",
                     BaseConstants.tags.UIButton_defence : "defence_014",
                     BaseConstants.tags.UIButton_dont_hurt_me : "dont_hurt_me_012",
                     
                     BaseConstants.tags.UIButton_feed_or_pet: "feed_or_pet_009",
                     BaseConstants.tags.UIButton_lone : "lonely_010",
                     BaseConstants.tags.UIButton_marriage_despute : "marriage_despute_002",
                     BaseConstants.tags.UIButton_answer_bb: "mother_answer_bb_feed_care_004",
                     
                     BaseConstants.tags.UIButton_bb_happy : "bb_happy_005",
                     BaseConstants.tags.UIButton_bb_ask_care_food : "bb_want_feed_care_003",
                     BaseConstants.tags.UIButton_bb_wakeup : "bb_wakeup_007",
                     BaseConstants.tags.UIButton_bb_sleepy : "bb_sleepy_006",
                     
                     BaseConstants.tags.UIButton_protest : "protest_013",
                     BaseConstants.tags.UIButton_warning : "warning_001",
                     ]
    
    
    
//MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
//MARK: Methods
    private func setupPlayer(){
        player?.delegate = self
    }
    private func setupButtons() {
        
        // Clear the button
        removeArrangedSubview(playButton)
        playButton.removeFromSuperview()
        
        soundLabel.text = labelText
        soundLabel.textAlignment = .center
        soundLabel.lineBreakMode = .byWordWrapping
        soundLabel.numberOfLines = 3

        
        addArrangedSubview(soundLabel)
        
        
        let bundle = Bundle(for: type(of: self))
        let soundPlay = UIImage(named: "soundPlay", in: bundle, compatibleWith: self.traitCollection)
        let soundStop = UIImage(named:"soundStop", in: bundle, compatibleWith: self.traitCollection)
        
        
        playButton.setImage(soundPlay, for: .normal)
        

        
        // Style
        playButton.contentVerticalAlignment = .center;

        
        
        // Add constraints
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        playButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10)
     
        // Setup the button action
        playButton.addTarget(self, action: #selector(TPSOundButton.ratingButtonTapped(button:)), for: .touchUpInside)
        
        // Add the button to the stack
        addArrangedSubview(playButton)

    }

    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {

        if isPlay == false{
            play();
        }else{
            stop();
            
        }
    }
    
    func play(){
        playButton.setImage(#imageLiteral(resourceName: "soundStop"), for: .normal)
        
        isPlay = true;
        playSound(self.tag);
        print("play")
    }
    
    func stop(){
        player?.stop()
        playButton.setImage(#imageLiteral(resourceName: "soundPlay"), for: .normal)
        isPlay = false;
        print("Stop")
        
    }
    
    func setUILabelText(_ labelText: String){
        self.labelText = labelText;
        self.soundLabel.text = labelText;
    }
    
    private func playSound(_ tag: Int){
        
        if let soundClicked = soundList[tag] {
            debugPrint("sound file:\(soundClicked)");
            if let soundObj = TPSound(identifier: tag, description: "", file: soundClicked, image: nil) {
                
                guard let url = Bundle.main.url(forResource: soundObj.file, withExtension: "mp3") else { return }
                
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                    try AVAudioSession.sharedInstance().setActive(true)
                    
                    
                    
                    /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                    player?.delegate = self;
                    
                    /* iOS 10 and earlier require the following line:
                     player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
                    
                    guard let player = player else { return }
                    
                    player.play()
                    
                } catch let error {
                    print(error.localizedDescription)
                }
                
            }else{
                print("no sound name")
            }
        }else{
            print("No sounds matched.");
        }
        
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        stop()
    }
    
}
