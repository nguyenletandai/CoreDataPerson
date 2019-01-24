//
//  ViewController.swift
//  CoreDataPerson
//
//  Created by daicudu on 1/21/19.
//  Copyright © 2019 daicudu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    var person = DataService.shared.selectedPerson
    override func viewDidLoad() {
        super.viewDidLoad()
        if let person = person {
            nameTextField.text = person.name
            ageTextField.text = String(person.age)
            if let avatar = person.avatar {
                avatarImage.image = UIImage(data: avatar)
            }
        }
    }
    
    @IBAction func getImageFromLibary(_ sender: UITapGestureRecognizer) {
        // an textField
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        // only allow photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    @objc
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("loi me no roi then lol: loi day nay: \(info)")
        }
        avatarImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let person = person {
          DataService.shared.edit(name: nameTextField.text, ageString: ageTextField.text, image: avatarImage.image)
            
        } else {
            DataService.shared.createPerson(name: nameTextField.text, ageString: ageTextField.text, image: avatarImage.image)
        }
    }
    
}

