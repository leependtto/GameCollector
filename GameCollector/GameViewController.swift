//
//  GameViewController.swift
//  GameCollector
//
//  Created by Lee Pendexter on 6/8/17.
//  Copyright © 2017 appdog. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var gameimageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       imagePicker.delegate = self
    }

    @IBAction func photosTapped(_ sender: Any) {
        
     imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        gameimageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func camaraTapped(_ sender: Any) {
    }
    @IBAction func addTapped(_ sender: Any) {
        
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    let game = Game(context: context)
        
    game.title = titleTextField.text
        
    game.image = UIImagePNGRepresentation(gameimageView.image!)! as NSData
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
      navigationController!.popViewController(animated: true)
    }
}
