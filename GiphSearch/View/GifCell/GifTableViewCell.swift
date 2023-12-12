//
//  GifTableViewCell.swift
//  GiphSearch
//
//

import UIKit
import SDWebImage

class GifTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var gifImageView: SDAnimatedImageView!
    
    static var identifier = "GifTableViewCell"
    
    override func prepareForReuse() {
        gifImageView.image = nil
    }
    
    func configure(gifImageUrl: URL?) {
        let transformer = SDImageResizingTransformer(size: self.gifImageView.frame.size,
                                                     scaleMode: .aspectFit)
        
        gifImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        gifImageView.sd_setImage(with: gifImageUrl,
                                 placeholderImage: nil,
                                 options: [.progressiveLoad],
                                 context: [.imageTransformer: transformer])
    }
}
