//
//  CustomNavigationView.swift
//  AlliedProject
//
//  Created by sharaf on 12/11/2021.
//

import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parent: self)
    }
    
    var view : Home
    var onSearching : (String)->()
    var onCancel:()->()
    init(view:Home,onsearching:@escaping(String)->(), oncancel:@escaping()->()) {
        self.view = view
        self.onCancel = oncancel
        self.onSearching = onsearching
    }
    func makeUIViewController(context: Context) -> UINavigationController {
        let childView = UIHostingController(rootView: view)
        let controller = UINavigationController(rootViewController: childView)
        controller.navigationBar.topItem?.title = "Cats"
        controller.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.delegate = context.coordinator
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        controller.navigationBar.topItem?.searchController = searchController
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    class Coordinator: NSObject,UISearchBarDelegate {
        
        var parent : CustomNavigationView
         init(parent:CustomNavigationView) {
            self.parent = parent
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.parent.onSearching(searchText)
        }
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            self.parent.onCancel()
        }
    }
}


