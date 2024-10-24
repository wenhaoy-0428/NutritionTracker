//
//  ImageProcess.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/22.
//
import Vision
import CoreImage
import SwiftUI

//class NutritionFactDetectionRequest: VisionRequest {
//    
//}

@Observable
class ImageProcess {
    // TODO: @MainActor
    var observations: [RecognizedTextObservation] = []
    
    
    
    func extractRectangle() {
        var request = RecognizeTextRequest()
        
        Task {
            do {
                let result = try await request.perform(on: CIImage(image: UIImage(named: "NutritionFacts")!)!)
                observations = result
                print(result[0].topCandidates(3))
            }
            catch {
                print("Error")
            }
        }
    }
}
