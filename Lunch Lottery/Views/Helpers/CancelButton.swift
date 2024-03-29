//
//  CancelButton.swift
//  Lunch Lottery
//
//  Created by TommyVC04 on 9/28/22.
//

import SwiftUI

struct CancelButton: View {
    @Binding var isSet: Bool
    @State private var showSure = false
    @EnvironmentObject var modelData: ModelData
    var landmarkIndex: Int

    var body: some View {
        Button (action: {showSure = true} ){
            Text("Cancel")
        }
        .padding()
        .foregroundColor(.gray)
        .background(Color(red: 211.0/255, green: 211.0/255, blue: 211.0/255))
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .confirmationDialog("Are you sure?", isPresented: $showSure, titleVisibility: .visible) {
            Button("Yes", role: .destructive) {
                modelData.landmarks[landmarkIndex].isConfirmed.toggle()
            }
            Button("Cancel", role: .cancel) {}
        }
    }
}

func removeConfirm() {
    //ENTER LOTTERY
}

struct CancelButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton(isSet: .constant(true), landmarkIndex: 0)
            .environmentObject(ModelData())
    }
}
