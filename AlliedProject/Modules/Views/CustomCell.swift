//
//  AppetizerCell.swift
//  SwiftUI-MVVM
//
//  Created by Sean Allen on 5/24/21.
//

import SwiftUI

struct CustomCell: View {
    
    let model: payload?
    
    var body: some View {
        HStack {
            DownloadRemoteImage(urlString: model?.image ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 5) {
                Text(model?.name ?? "")
                    .font(.title2)
                    .fontWeight(.medium)
                
                
            }
            .padding(.leading)
        }
    }
}


struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomCell(model: MockData.sampleUser)
    }
}
