//
//  UserDetailsView.swift
//  UsersApp
//
//  Created by Полина Лущевская on 6.05.24.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("User Details")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 4)
            
            Text("ID: \(user.id)")
                .font(.subheadline)
                .foregroundColor(.white)
            
            Text("Name: \(user.name)")
                .font(.subheadline)
                .foregroundColor(.white)
            
            Text("Username: \(user.username)")
                .font(.subheadline)
                .foregroundColor(.white)
            
            Text("Email: \(user.email)")
                .font(.subheadline)
                .foregroundColor(.white)
            
            Text("Phone: \(user.phone)")
                .font(.subheadline)
                .foregroundColor(.white)
            
            Text("Website: \(user.website)")
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.pink)
                .shadow(radius: 5)
        )
        .padding()
    }

}


#Preview {
    UserDetailsView(user:User(id:1,name:"John Doe",username:"johndoe", email: "g@gmail.com",phone: "+999999999999",website: "hfh.com"))
}
