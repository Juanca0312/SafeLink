//
//  ContentView.swift
//  SaveLink
//
//  Created by Juan Carlos Hernandez Castillo on 6/10/23.
//

import SwiftUI

enum AuthenticationSheetView: String, Identifiable {
    case register
    case login
    
    var id: String {
        return rawValue
    }
}

struct AuthenticationView: View {
    
    @State private var authenticationSheetView: AuthenticationSheetView?
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 200, height: 200)
            VStack {
                Button {
                    authenticationSheetView = .login
                } label: {
                    Label("Entra con Email", systemImage: "envelope.fill")
                }
                .tint(.black)
            }
            .controlSize(.large)
            .buttonStyle(.bordered)
            .padding(.top, 60)
            
            Spacer()
            
            HStack {
                Button {
                    authenticationSheetView = .register
                } label: {
                    Text("No tienes cuenta?")
                    Text("Regístrate")
                        .underline()
                }
                .tint(.black)
            }
            
        }
        .padding()
        .sheet(item: $authenticationSheetView) { sheet in
            switch sheet {
            case .login:
                Text("login")
            case .register:
                Text("register")
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
