//
//  CameraViewController.swift
//  CameraAndPhotoLibrary
//
//  Created by Kristin Kamenar on 6/21/16.
//  Copyright © 2016 Kristin Kamenar. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    //create instance of ImagePickerController
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the delegate
        //imagePicker gets a notification when something happens
        //tell the ViewController
        imagePicker.delegate = self

    }
    

    @IBAction func photoButtonTapped(sender: UIButton) {
        
        getPhotoLibrary()
    }


    @IBAction func cameraButtonTapped(sender: UIButton) {
        
        //check to see if there is a camera available
        //if so, use it
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            //set source type to camera
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            
            //present
            presentViewController(imagePicker, animated: true, completion: nil)
            
        }
        
        //if a camera isn't available, use the photo library
        else
        {
                getPhotoLibrary()
        }
        
    }
    
    //helper function will be called by both photo and 
    //camera buttons
    func getPhotoLibrary()
    {
        //determine if using photo library
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        //present
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    //when you pick the image or take a photo
    //when view controller dismisses, place image in image view
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imagePicker.dismissViewControllerAnimated(true, completion:
            {
                let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
                self.photoImageView.image = selectedImage
        })
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
