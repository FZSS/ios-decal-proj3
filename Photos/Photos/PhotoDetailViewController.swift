//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Fangzhou Chen on 4/13/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photo : Photo?
    
    @IBOutlet weak var Poster: UILabel!
    @IBOutlet weak var DatePosted: UILabel!
    @IBOutlet weak var NumberOfLikes: UILabel!
    @IBOutlet weak var LikeButton: UIButton!
    @IBOutlet weak var Image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loading")

        // Do any additional setup after loading the view.
        Poster.text = "Poster: " + "\(photo!.username)"
        DatePosted.text = "Date: " + "\(photo!.date)"
        NumberOfLikes.text = "Likes: \(photo!.likes)"
        let url = NSURL(string: (photo?.url)!)
        if let data = NSData(contentsOfURL: url!) {
            Image.image = UIImage(data: data)
        }
    }
    
    @IBAction func likePressed(sender: UIButton) {
        if(LikeButton.titleLabel!.text == "♥️") {
            print("pressed")
            LikeButton.setTitle("🚫", forState: UIControlState.Normal)
            NumberOfLikes.text = "Likes: \(photo!.likes + 1)"
        } else {
            LikeButton.setTitle("♥️", forState: UIControlState.Normal)
            NumberOfLikes.text = "Likes: \(photo!.likes)"
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
