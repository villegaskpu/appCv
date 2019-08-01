//
//  PageCell.swift
//  appVCDavidVillegas
//
//  Created by David on 7/31/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import UIKit


class PageCell: UICollectionViewCell {
    
    var page:Page? {
        didSet{
            
            guard let unWpage = page else {return}
            
            imageview.image = UIImage(named: unWpage.imageNombre)
            titulo.text = unWpage.titulo
            descriptionTextView.text = unWpage.subTitulo
            
            descriptionTextView.attributedText = setDescripcion(unWpage.descripciones)
            descriptionTextView.textAlignment = NSTextAlignment.justified
        }
    }
    
    private func setDescripcion(_ desc:[descripcion]) ->  NSMutableAttributedString{
        let attributedText = NSMutableAttributedString()
        for a in desc {
            attributedText.append(NSMutableAttributedString(string: "\n\(a.titulo)\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]))
            attributedText.append(NSMutableAttributedString(string: "\n\(a.Actividades)\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        }
        
        return attributedText
    }
    
    private let titulo : UILabel = {
        let titulo = UILabel()
        titulo.font = UIFont.boldSystemFont(ofSize: 20)
        titulo.textAlignment = .center
        titulo.textColor = .colorActivo
        titulo.translatesAutoresizingMaskIntoConstraints = false
        return titulo
    }()
    
    private let imageview:UIImageView = {
        let img = UIImage(named: "foto")!
        let imageview = UIImageView(image: img)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        Commons.addShadow(view: imageview)
        return imageview
    }()
    
    private let descriptionTextView:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = NSTextAlignment.justified
        textView.isEditable = false
        textView.isScrollEnabled = true
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has  not been implemented")
    }
    
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        addSubview(titulo)
        addSubview(descriptionTextView)
        
        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        titulo.frame = CGRect(x: 0, y: 0, width: 100, height: 25)
        
        topImageContainerView.addSubview(imageview)
        
        NSLayoutConstraint.activate([
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titulo.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor),
            titulo.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor),
            
            imageview.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            imageview.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            imageview.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            
            titulo.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor),
            titulo.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor),
            titulo.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: 30),
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
        ])
        
    }
}
