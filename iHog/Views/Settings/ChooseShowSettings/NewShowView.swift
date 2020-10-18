//
//  NewShowView.swift
//  iHog
//
//  Created by Maegan Wilson on 10/16/20.
//

import SwiftUI

struct NewShowView: View {
    @Binding var isShowing: Bool
    @State private var showName: String = "New Show"
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    isShowing.toggle()
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
                Button(action: {
                    print("Save in CoreData and close window")
                    isShowing.toggle()
                }){
                    Text("Add Show")
                        .foregroundColor(.green)
                }
            }
            .padding()

        }
        .background(Color.white.opacity(0.80))
    }
}

struct NewShowView_Previews: PreviewProvider {
    static var previews: some View {
        NewShowView(isShowing: .constant(true))
    }
}

