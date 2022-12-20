//
//  profileScreen.swift
//  HealthMoniter
//
//  Created by  on 12/8/22.
//

import SwiftUI

struct profileScreen: View {
    var body: some View {
        VStack
        {
            Text("In Development")
                .font(.subheadline)
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing)
                    {
                        Button {
                            ""
                        } label: {
                            Text("\("Name")")
                            Image(systemName: "person.crop.circle.badge.questionmark")
                                .font(.largeTitle)

                        }
                    }

                }
            
            HStack
            {
                Text("\("Name")")
                Spacer()
            }.padding()
            Spacer()
        }
    }
}

struct profileScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView
        {
            profileScreen()
        }
    }
}
