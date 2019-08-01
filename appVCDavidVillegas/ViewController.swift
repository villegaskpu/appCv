//
//  ViewController.swift
//  appVCDavidVillegas
//
//  Created by David on 7/31/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageview:UIImageView = {
        let img = UIImage(named: "foto")!
        let imageview = UIImageView(image: img)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    let descriptionTextView:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedText = NSMutableAttributedString(string: "hola como estas", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSMutableAttributedString(string: "\n\n\nhdashl dhldh  hiodsahidasoidd hs io hdoias  hdihdiosh iohds", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    private let btnAtras: UIButton = {
        let boton = UIButton(type: UIButton.ButtonType.system)
        boton.setTitle("<", for: UIControl.State.normal)
        boton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        boton.translatesAutoresizingMaskIntoConstraints = false
        boton.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        return boton
    }()
    
    private let btnSiguiente: UIButton = {
        let boton = UIButton(type: UIButton.ButtonType.system)
        boton.setTitle(">", for: UIControl.State.normal)
        boton.translatesAutoresizingMaskIntoConstraints = false
        boton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        boton.setTitleColor(.colorActivo, for: .normal)
        return boton
    }()
    
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .colorActivo
        pc.pageIndicatorTintColor = UIColor.gray
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(descriptionTextView)
        setupBottomControls()
        setupLayout()
    }
    
    
    fileprivate func setupBottomControls() {
        
        let bottonControlsStackView = UIStackView(arrangedSubviews: [
            btnAtras,
            pageControl,
            btnSiguiente
        ])
        
        bottonControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottonControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottonControlsStackView)
        
        NSLayoutConstraint.activate([
            bottonControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottonControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottonControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottonControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func  setupLayout() {
        
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)

        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            imageview.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            imageview.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            imageview.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor),
            descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        topImageContainerView.addSubview(imageview)
        
        
    }


}
extension UIColor {
    static var colorActivo = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

