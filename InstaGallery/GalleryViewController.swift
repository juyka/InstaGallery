//
//  GalleryViewController.swift
//  InstaGallery
//
//  Created by Анастасия Васюра on 10/07/16.
//  Copyright © 2016 Анастасия Васюра. All rights reserved.
//

import UIKit

final class GalleryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: GalleryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadMedia { error in
            self.collectionView.reloadData()
        }
    }
}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mediaItems.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MediaCollectionViewCell
        let mediaItem = viewModel.mediaItems[indexPath.row]
        cell.photoImageView.load(mediaItem.url)
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
    }
}


