//
//  BindToggleEx.swift
//  0212_SwiftUIEx03
//
//  Created by Uihyun.Lee on 2/12/25.
//

import SwiftUI

struct ParentView: View {
    @State var isOn = false
    var body: some View {
        Text("isOn: \(isOn)")
        ToggleView(isOn: $isOn)
    }
}

struct ToggleView: View {
    @Binding var isOn: Bool
    var body: some View {
        VStack{
            
            Toggle("IsOn", isOn: $isOn)
        }
        .padding()
    }
}

struct BindToggleEx: View {
    
    var body: some View {
        ParentView()
        
    }
}

#Preview {
    BindToggleEx()
}
