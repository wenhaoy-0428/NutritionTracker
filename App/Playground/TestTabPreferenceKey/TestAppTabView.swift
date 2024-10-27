//
//  TestAppTabView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/19.
//
/*
 import SwiftUI
 
 struct TestAppTabView<Content: View>: View {
 
 @State private var index: Int = 0
 @State private var tabView: [TestAppTabViewPair] = []
 var tabs: [AppTabBarItem] {
 tabView.map { pair in
 pair.tab
 }
 }
 //
 //    @State private var tabs: [AppTabBarItem] = []
 
 @Binding var selection: AppTabBarItem
 private let content: Content
 
 init(selection: Binding<AppTabBarItem>, @ViewBuilder content: () -> Content) {
 self._selection = selection
 self.content = content()
 }
 
 var body: some View {
 ZStack {
 Color(UIColor.secondarySystemBackground)
 .ignoresSafeArea()
 ZStack(alignment: .bottom) {
 // Content
 //                getContent()
 //                .frame(maxWidth: .infinity, maxHeight: .infinity)
 // TabBar
 AppTabBarView(tabs: tabs, selection: $selection)
 
 Text("\(tabs.count) \(tabView.count)")
 }
 .ignoresSafeArea(.all, edges: .bottom)
 } // Listen to PreferenceKey to update registered tabs
 .onPreferenceChange(TestAppTabBarItemsPreferenceKey2.self) { value in
 self.tabView = value
 }
 }
 
 func getContent() -> some View {
 let temp = tabView.filter({ pair in
 pair.tab == selection
 }).first!
 
 
 return AnyView(temp.view)
 }
 }
 
 
 #Preview {
 @Previewable @State var selection: AppTabBarItem = .main
 let tabs: [AppTabBarItem] = []
 
 TestAppTabView(selection: $selection) {
 Color.red
 .appTabBarItem(tab: .main, selection: selection)
 
 Color.green
 .appTabBarItem(tab: .misc, selection: selection)
 
 }
 }
 */
