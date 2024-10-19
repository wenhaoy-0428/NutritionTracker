//
//  MainTabView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/19.
//

import SwiftUI

struct MainTabView<Content: View>: View {
    @State private var index: Int = 0
    private let content: () -> Content
    
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                content()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer()
                Tabs(index: $index)
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
        
       
    }
}

struct Tabs: View {
    @Binding var index: Int
    
    
    var body: some View {
        HStack {
            MainInsertButton()
            .offset(y: -25)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 35)
        .background(Color(UIColor.systemBackground))
        .clipShape(ArcShape())
        
    }
}

struct ArcShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x:0, y:35))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 35))
            
            path.addArc(center: CGPoint(x: rect.width / 2, y: 35), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
        }
    }
}


#Preview {
    MainTabView {
        Text("Content")
    }
}
