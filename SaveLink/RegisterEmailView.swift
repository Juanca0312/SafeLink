//
//  RegisterEmail.swift
//  SaveLink
//
//  Created by Juan Carlos Hernandez Castillo on 7/10/23.
//

import SwiftUI

struct RegisterEmailView: View {
    
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    
    var body: some View {
        VStack {
            DismissView()
            Group {
                Text("Bienvenido a")
                Text("Juanca apps")
                    .bold()
                    .underline()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.primary)
            
            Group {
                Text("Regístrate para acceder a tus links")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                TextField("Añade tu email", text: $textFieldEmail)
                TextField("Añade tu password", text: $textFieldPassword)
                Button ("Registrar") {
                    print("register function")
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            
            Spacer()
        }
        .padding(.vertical)
    }
}

struct RegisterEmail_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmailView()
    }
}
