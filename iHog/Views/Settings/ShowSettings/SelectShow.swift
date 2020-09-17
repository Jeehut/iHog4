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
                    VStack(alignment: .leading){
                        Text("\(show.name)")
                            .font(.title)
                        Text("\(show.note)")
                            .font(.subheadline)
                        Group{
                            HStack{
                                Text("Opened: \(formatDate(date: show.dateLastModified))")
                                    .font(.footnote)
                            }
                            HStack{
                                Text("Created: \(formatDate(date: show.dateCreated))")
                                    .font(.footnote)
                            }
                        }
                        .foregroundColor(Color.secondary)
                    }
                    .padding(.all)
                    .frame(width: 200.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary, lineWidth: 5)
                    )
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
    
    func formatDate(date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MMM dd,yyyy HH:mm"
        
        let stringDate = dateformatter.string(from: date)
        return stringDate
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
