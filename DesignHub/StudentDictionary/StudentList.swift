//
//  StudentList.swift
//  DesignHub
//
//  Created by Vikram Kumar on 06/06/26.
//

import SwiftUI

struct studentView : View {
    
    @State var students : [String : String] = [:]
    
    @State var name : String = ""
    @State var id : String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                
                TextField("enter name" , text: $name )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("enter id " , text: $id )
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
                
                List(students.keys.sorted() , id: \.self ){ id in
                    HStack{
                        
                        Text(id)
                        
                        Text(students[id] ?? "" )
                    }
                    .backgroundStyle(Color.accentColor)
                }
                
            }
            .navigationTitle("Ferment")
        }
    }
}

#Preview {
    studentView()
}
