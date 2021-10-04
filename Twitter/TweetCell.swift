//
//  TweetCell.swift
//  Twitter
//
//  Created by emmanuel ortiz on 9/24/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageVeiw: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var reTweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    

    @IBAction func favTweet(_ sender: Any) {
       let toBeFavorited = !favorited
        if toBeFavorited {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { Error in
                print("Favorite did not succeed: \(Error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { Error in
                print("Unfavorite did not succeed: \(Error)")
            })
        }
        
        
    }
    
    @IBAction func reTweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (Error) in
            print("Error in retweeting: \(Error)")
        })
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        if isRetweeted {
            reTweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            reTweetButton.isEnabled = false
        }else{
            reTweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            reTweetButton.isEnabled = true
        }
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if favorited {
            likeButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }else{
            likeButton.setImage(UIImage(named: "favor-icon-1"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
