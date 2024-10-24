//
//  PhotoCaptureView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/22.
//

import SwiftUI

import PhotosUI


struct PhotoCaptureView: View {
    
    let image = Image("NutritionFacts")
    @State var ip = ImageProcess()
        
    var body: some View {
        Text("A").onAppear {
            ip.extractRectangle()
        }
        image
            .resizable()
            .scaledToFit()
            .background(Color.green)
            .overlay {
                GeometryReader {geometry in
                    Text("A")
                        .foregroundStyle(Color.blue)
                        .position(x: geometry.size.width * 0.18, y: geometry.size.height * 0.42)
                    ForEach(ip.observations, id: \.self) {bbox in
                        BBox(rect: bbox.boundingBox.verticallyFlipped().toImageCoordinates(geometry.size))
                    }
                }
                
            }
    }
}

struct BBox: View {
    let rect: CGRect
    
    var body: some View {
        Path { path in
            path.addRect(rect)
        }
        .stroke(Color.red, lineWidth: 2)
    }
}



#Preview {
    PhotoCaptureView()
}
