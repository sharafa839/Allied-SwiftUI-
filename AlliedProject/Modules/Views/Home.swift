//
//  Home.swift
//  AlliedProject
//
//  Created by sharaf on 12/11/2021.
//

import SwiftUI

struct Home: View {
    @StateObject  var viewModel = UserViewModel()
    @Binding var filterItems :  [payload]

    var body: some View {
        ZStack {
            
                
            List(viewModel.Users,id:\.self){user in
                    NavigationLink(
                     destination: DetailView(user: user),
                     label: {
                         CustomCell(model: user)

                     })
                    
                }
            
            .onAppear { viewModel.getUser() }
            
            if viewModel.isLoading { LoadingView() }
        }
    }
}


