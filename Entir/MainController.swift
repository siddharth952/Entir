//
//  MainController.swift
//  Entir
//
//  Created by Siddharth sen on 11/22/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import UIKit
import LBTATools

class PostCell:LBTAListCell<String>{
    
    //To render out elements inside the .darkGray post
    let imageView = UIImageView(backgroundColor: .red)
    let nameLabel = UILabel(text:"Name Label")
    let dateLabel = UILabel(text:"Monday at 11:00AM")
    let postTextLabel = UILabel(text:"Here is the post text!")
    let imageViewGrid = UIView(backgroundColor: .yellow)
    
    override func setupViews(){
        backgroundColor = .white
        
        //vertical stack
        stack(hstack(imageView.withHeight(40).withWidth(40),
                     stack(nameLabel,dateLabel),
                     spacing:8
            ).padLeft(12).padRight(12).padTop(8),
              postTextLabel,imageViewGrid,spacing:12)
        
    }
    
}

class MainController: LBTAListController<PostCell,String>,UICollectionViewDelegateFlowLayout{
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .yellow
        
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        
        self.items = ["Test","Test2","",""]
    }
    
    //Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
}

import SwiftUI
struct MainPreview:PreviewProvider{
    static var previews: some View{
        //Text("Main preview")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    
    
    struct ContainerView: UIViewControllerRepresentable{
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
    }
}
