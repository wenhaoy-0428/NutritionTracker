//
//  IntakeInsertSheet.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/19.
//

import SwiftUI


/**
 // This is used as a Environment Object that is injected to all the subviews in this  sheet.
 *
 * The only reason this Object is used is to dismiss the searchBar when user selects an entry in the search suggestion.
 * **Original Problem**
 *      The dismissSearch is designed that can only be called within the SeachedView, where the SearchedView has to be a
 *      seperate view from where .suggestable() is defined. Offcial example can be found in https://developer.apple.com/documentation/swiftui/environmentvalues/dismisssearch
 *
 * struct ContentView: View {
 *   @State private var searchText = ""
 *
 *    var body: some View {
 *        NavigationStack {
 *            SearchedView(searchText: searchText)
 *                .searchable(text: $searchText)
 *        }
 *    }
 *   }
 * **Solution**: https://forums.developer.apple.com/forums/thread/740878
 *  As the solution indicates, a reference to the searchDismiss() from the SearchedView is required to be stored within the parent
 *   view to make it capable of calling it.
 *
 * After extracting the SearchedView, however, selectedFood is used in multiple parallel views therefore, it is used as an Environment Object. In swiftUI, The **environment object iteself is read-only**, so we can't pass selectedFood itself as an Environment, cuz that makes it read-only, and we can't change the food it references to afterwards.
    
    Hence a wrapper class SheetData is created, and dismissClosure function is placed as Environment Object for cleaner code.
 *
 *
 */
@Observable
class SheetData {
    var selectedFood: Food?
    var dismissClosure: () -> Void = { print("Not Set") }
}

struct IntakeInsertSheet: View {
    @State var searchText: String = ""
    @State var sheetData: SheetData = SheetData()
    
    var body: some View {
        NavigationStack {
            IntakeInsertView()
                .environment(sheetData)
                .searchable(text: $searchText, prompt: "Search Foods..")
                .searchSuggestions {
                    FoodSuggestionView(searchText: searchText)
                        .environment(sheetData)
                }
        }
    }
}

#Preview {
    IntakeInsertSheet()
}
