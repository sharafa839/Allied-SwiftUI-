//
//  ContentView.swift
//  AlliedProject
//
//  Created by sharaf on 11/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var filterItems =  [payload]()
    var body: some View {
        CustomNavigationView(view: Home(filterItems: $filterItems), onsearching: { text in
            print("Swift")
            if text != ""{
                self.filterItems = filterItems.filter({ $0.name.lowercased().contains(text.lowercased()) })
            }else{
                self.filterItems = filterItems
            }
        }, oncancel: {
            self.filterItems = filterItems

        })
    .ignoresSafeArea()
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
        
    }
}

