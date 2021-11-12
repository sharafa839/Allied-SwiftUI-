//
//  DetailView.swift
//  AlliedProject
//
//  Created by sharaf on 12/11/4021.
//

import SwiftUI

struct DetailView: View {
    var user:payload?
    var body: some View {
        ZStack{
            DownloadRemoteImage(urlString: user?.image ?? "")
                .aspectRatio(contentMode: .fill)
                .frame(width: 280, height: 180)
                .cornerRadius(8)
            Text(user?.name ?? "")
                
            
                .background(Color.gray)
                
                .frame(width: 300, height: 170, alignment: .bottom)
              
            
        }
        VStack{
            HStack{
                Text("Birth day : " + "\(user?.birthYear ?? "")").frame(width: 300, height: 40, alignment: .leading)
            }
            HStack{
                Text("Gender: " + "\(user?.gender ?? "NoGender")").frame(width: 300, height: 40, alignment: .leading)
            }
            HStack{
                Text("Height: " + "\(user?.height ?? "NoHeight")").frame(width: 300, height: 40, alignment: .leading)
            }
            HStack{
                Text("Mass: " + "\(user?.name ?? "NoMass")").frame(width: 300, height: 40, alignment: .leading)
            }
            HStack{
                Text("Eye color: " + "\(user?.name ?? "NoEyecolor")").frame(width: 300, height: 40, alignment: .leading)
            }
            HStack{
                Text("Hair color: " + "\(user?.hairColor ?? "NoHaircolor")").frame(width: 300, height: 40, alignment: .leading)
            }
            HStack{
                Text("Skin color: " + "\(user?.skinColor ?? "NoSkincolor")").frame(width: 300, height: 40, alignment: .leading)
            }
        }
       Spacer()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
