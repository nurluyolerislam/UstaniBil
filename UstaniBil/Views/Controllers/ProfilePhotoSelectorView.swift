//
//  ProfilePhotoSelectorView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 14.06.2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            Button {
                self.showImagePicker.toggle()
            } label: {
                if let profileImage = self.profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    VStack{
                        Text("Prorfil Fotoğrafı Seç")
                        
                        Image(systemName: "plus")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(ProfileImageModifier())
                    }
                }
            }
            .sheet(isPresented: self.$showImagePicker) {
                self.loadImage()
            } content: {
                ImagePicker(selectedImage: self.$selectedImage)
            }
            .padding(.top, 44)
            
            if let selectedImage = self.selectedImage {
                Button {
                    self.viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Tamamla")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10)
            }
            
            Spacer()
        }
    }
    
    func loadImage(){
        guard let selectedImage = self.selectedImage else { return }
        self.profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.accentColor)
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}
