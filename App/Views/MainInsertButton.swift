//
//  MainInsertButton.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/19.
//

import SwiftUI

struct MainInsertButton: View {
    @State var showSheet: Bool = false
    
    var body: some View {
        Button {
            showSheet.toggle()
        }
        label: {
            ZStack {
                Circle()
                    
                Image(systemName: "plus")
                    .resizable()
                    .padding(8)
                    .foregroundStyle(Color.white)
            }
            .frame(width: 50, height: 50)
        }
        .sheet(isPresented: $showSheet) {
            IntakeInsertSheet()
        }
    }
}

#Preview {
    MainInsertButton()
}
