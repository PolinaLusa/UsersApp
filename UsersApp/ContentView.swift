//
//  ContentView.swift
//  UsersApp
//
//  Created by Полина Лущевская on 6.05.24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var users: [User] = []
    @State private var selectedUser: User? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 1) {
                    ForEach(users, id: \.id) { user in
                        HStack {
                            Button(action: {
                                withAnimation {
                                    selectedUser = user
                                }
                            }) {
                                UserView(user: user)
                                    .padding()
                                    .background(selectedUser == user ? RoundedRectangle(cornerRadius: 15).fill(Color("LightPink")) : RoundedRectangle(cornerRadius: 15).fill(Color.clear))
                                    .scaleEffect(selectedUser == user ? 1.1 : 1.0)
                                    .animation(.spring())
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                                removeUser(user)
                            }) {
                                Image(systemName: "trash")
                                    .font(.title)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                .padding(.top, 1)
            }
            .navigationTitle("Users")
            .sheet(item: $selectedUser) { user in
                UserDetailsView(user: user)
            }
            .onAppear {
                loadUsers()
            }
        }
    }
    
    func removeUser(_ user: User) {
        users.removeAll { $0.id == user.id }
    }
    
    private func loadUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let users = try decoder.decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = users
                    }
                } catch {
                    print("Error decoding user data: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
