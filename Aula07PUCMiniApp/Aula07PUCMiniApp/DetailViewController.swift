//
//  DetailViewController.swift
//  Aula07PUCMiniApp
//
//  Created by Eduardo dos santos on 25/12/14.
//  Copyright (c) 2014 Eduardo dos santos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var onOffZoom: UISwitch!
    
    var imgSelected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    scrollView.maximumZoomScale = 4
    scrollView.minimumZoomScale = 1
    scrollView.zoomScale = 1
        
    //Ajusta o tamanho da ImageVIew para o tamanho da imagem.
    imageView.image = UIImage(named: imgSelected!)
    imageView.sizeToFit()
    }
    
    //Ajusta o tamanho do Scroll view para o tamanho da imagem.
    override func viewWillLayoutSubviews() {
        scrollView.contentSize = imageView.frame.size
    }
    
    //Retorna a imagemView na qual deve ser dado o Zoom com o efeito pinca
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    @IBAction func changeValue(sender: UISlider) {
        scrollView.zoomScale = CGFloat(sliderView.value)
    }
    
    //Atualiza o Scroll caso o Zom seja feito por pinça
    func scrollViewDidZoom(scrollView: UIScrollView) {
        sliderView.setValue(Float(scrollView.zoomScale), animated: true)
    }
    
    //Somente quando o Switch estiver on será possível dar Zoom seja por pinça ou por Slider
    @IBAction func turnOnOff(sender: AnyObject) {
        sliderView.enabled = onOffZoom.on
        
        scrollView.pinchGestureRecognizer.enabled = onOffZoom.on
    }
    

}
