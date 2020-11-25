//
//  Indicator.swift
//  DriveChat
//
//  Created by Microapples on 8/10/20.
//  Copyright © 2020 Programmer7. All rights reserved.
//

import SwiftUI

struct Indicator : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        
        
    }
}


struct Indicator_Previews: PreviewProvider {
    static var previews: some View {
        Indicator()
    }
}
