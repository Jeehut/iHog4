//
//  SelectShow.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//

import SwiftUI

struct SelectShow: View {
    var shows:[Show] = testShows
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 200, maximum: 300))
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 30){
                ForEach(shows, id: \.self){ show in
                    ShowBox(show: show)
                }
            }
        }
        .navigationBarItems(trailing: NewShowButton)
        .navigationTitle("Choose Show")
    }
    
    var NewShowButton: some View {
        Button(action: {
            print("Add new show")
        }, label: {
            Text("New Show")
        })
    }
}

struct SelectShow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Text("hello world")
            SelectShow()
        }
    }
}
