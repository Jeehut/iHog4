//
//  ShowBox.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//

import SwiftUI

struct ShowBox: View {
    var show: Show
    var body: some View {
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
    
    
    func formatDate(date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MMM dd,yyyy HH:mm"
        
        let stringDate = dateformatter.string(from: date)
        return stringDate
    }
}

struct ShowBox_Previews: PreviewProvider {
    static var previews: some View {
        ShowBox(show: testShows[0])
    }
}
