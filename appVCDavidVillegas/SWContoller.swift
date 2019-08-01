//
//  SWContoller.swift
//  appVCDavidVillegas
//
//  Created by David on 7/31/19.
//  Copyright © 2019 Yopter. All rights reserved.
//

import UIKit

class SWController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    let pages = [
        Page(titulo: "ING. DAVID VILLEGAS SANTANA", imageNombre: "foto", subTitulo: "EXPERIENCIA LABORAL", descripciones: [
            descripcion(titulo: "ATALAYA SYSTEMS", Actividades: "Desarrollo de Framework interno (Custom Views).\nActualización de Apps (Swift 4).\n\nDesarrollo de Framework de Geolocalización.\nImplementación de Kit Crashlytics de Fabric para el monitoreo de errores en apps."),
            descripcion(titulo: "DESARROLLADOR IOS EN SICOP CONSULTING S.A DE C.V", Actividades: "Desarrollo de aplicaciones nativas de IOS con lenguaje Swift 3 y 4\nConsumo de servicios REST (XML, Json).\nManejo de CocoaPods.\nExperiencia en almacenamiento sin conexión (CoreData)\nControl de versiones de lenguaje con Git y GitHub.\nManejo de notificaciones Push (FireBase).\nManejo de APIS Facebook.\nManejo de Storyboards y Xibs.\nManejo de Autolayout."),
            descripcion(titulo: "DESARROLLADOR WEB EN EL INSTITUTO ELECTORAL DEL ESTADO DE MÉXICO.", Actividades: "Desarrollo de sistemas Web en páginas JSP’S y JavaScript\nManejo de consultas en SQL."),
            descripcion(titulo: "HABILIDADES", Actividades: "\nManejo de bases de datos con MySQL y SQL.\nProgramación en PHP,C ,C++, JAVA, JSP, JavaScript.\nDesarrollo de páginas web con HTML")
            ]
        ),
        Page(titulo: "CURSOS", imageNombre: "cursos", subTitulo: "", descripciones: [
            descripcion(titulo: "Lugar: Code3e", Actividades: "Diploma: Desarrollo de IOS 10 Avanzado\nFecha: 09 de septiembre del 2017"),
            descripcion(titulo: "Lugar: KMMX.", Actividades: "Constancia:Desarrollo de Aplicaciones para IOS con Swift.\nFecha: 28 de Noviembre del 2015")
            ]
        ),
        Page(titulo: "DATOS PERSONALES", imageNombre: "datosPersonales", subTitulo: "", descripciones: [
            descripcion(titulo: "Ciudad", Actividades: "Toluca"),
            descripcion(titulo: "Colonia", Actividades: "Capultitlán"),
            descripcion(titulo: "Calle", Actividades: "Margarita Maza de Juárez  #25"),
            descripcion(titulo: "C.P", Actividades: "50260"),
            descripcion(titulo: "Cel.", Actividades: "7223004383"),
            descripcion(titulo: "Correo Electónico", Actividades: "davidvillegas14@gmail.com")
            ]
        )
    ]
    
    
    private let btnAtras: UIButton = {
        let boton = UIButton(type: UIButton.ButtonType.system)
//        boton.setTitle("<", for: UIControl.State.normal)
        boton.setImage(#imageLiteral(resourceName: "prv").withRenderingMode(.alwaysTemplate), for: UIControl.State.normal)
        boton.imageView?.contentMode = .scaleAspectFit
        boton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        boton.tintColor = .colorActivo
        boton.translatesAutoresizingMaskIntoConstraints = false
        boton.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        boton.addTarget(self, action: #selector(accionBtnAtras), for: UIControl.Event.touchUpInside)
        return boton
    }()
    
    
    @objc private func accionBtnAtras() {
        let index = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: index, section: 0)
        pageControl.currentPage = index
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        
    }
    
    private let btnSiguiente: UIButton = {
        let boton = UIButton(type: UIButton.ButtonType.system)
//        boton.setTitle(">", for: UIControl.State.normal)
        boton.setImage(#imageLiteral(resourceName: "nxt").withRenderingMode(.alwaysTemplate), for: UIControl.State.normal)
        boton.imageView?.contentMode = .scaleAspectFit
        boton.translatesAutoresizingMaskIntoConstraints = false
        boton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        boton.setTitleColor(.colorActivo, for: .normal)
        boton.tintColor = .colorActivo
        boton.addTarget(self, action: #selector(accionBtnSiguiente), for: UIControl.Event.touchUpInside)
        return boton
    }()
    
    
    @objc private func accionBtnSiguiente() {
        let index = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: index, section: 0)
        pageControl.currentPage = index
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        
    }
    
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .colorActivo
        pc.pageIndicatorTintColor = UIColor.gray
        return pc
    }()
    
    
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
    
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        
        print("hola")
        pageControl.currentPage = Int(x/view.frame.width)
        print(x, view.frame.width, x/view.frame.width)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = pages[indexPath.row]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
