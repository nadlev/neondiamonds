//
//  QRCodeVM.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeViewModel: View {
    let context = CIContext()
    let url: String
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        VStack {
            Image(uiImage: generateQRCodeImage(url))
                .interpolation(.none)
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .shadow(color: Color("ColorLightBlueMain"), radius: 26)
        }
        .background(Color.purple)
    }
    
    func generateQRCodeImage(_ url: String) -> UIImage {
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent) {
                return UIImage(cgImage: qrCodeCGImage)
            }

        }
        
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}
