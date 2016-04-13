//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
        photos = []
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        let imageView = UIImageView(frame:CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.width))
        let photo = photos[indexPath.item]
        loadImageForCell(photo, imageView: imageView)
        cell.addSubview(imageView)
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {return photos.count}
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: view.bounds.size.width, height: view.bounds.size.width)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let photo = photos[indexPath.row]
        performSegueWithIdentifier("showPhotoDetail", sender: photo)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPhotoDetail" {
            let detailedView = segue.destinationViewController as! PhotoDetailViewController
            detailedView.photo = sender as? Photo
        }
    }
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage.
    It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let url = NSURL(string: photo.url)
        if let data = NSData(contentsOfURL: url!) {
            imageView.image = UIImage(data: data)
        }
    }

    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
    
    
}

