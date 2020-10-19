//
//  NewShowView.swift
//  iHog
//
//  Created by Maegan Wilson on 10/16/20.
//

import SwiftUI

struct NewShowView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var isShowing: Bool
    
    @State private var showName: String = "New Show"
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    withAnimation{
                        isShowing.toggle()
                    }
                }){
                    Text("Cancel")
                }
            }
            .foregroundColor(.red)
            .padding()
            
            HStack{
                Text("Show Name")
                    .foregroundColor(.black)
                TextField("Show Name", text: $showName)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.blue)
            }
            .padding()
            
            HStack{
                Spacer()
                Button(action: addShow){
                    Text("Add Show")
                        .foregroundColor(.green)
                }
            }
            .padding()
            
        }
        .background(Color.white.opacity(0.90))
        .cornerRadius(DOUBLE_CORNER_RADIUS)
    }
    
    private func addShow(){
        withAnimation{
            let newShow = ShowEntity(context: viewContext)
            newShow.dateCreated = Date()
            newShow.dateLastModified = Date()
            newShow.id = UUID()
            newShow.name = showName
            newShow.note = ""
            isShowing.toggle()
            
            do{
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct NewShowView_Previews: PreviewProvider {
    static var previews: some View {
        NewShowView(isShowing: .constant(true))
    }
}

