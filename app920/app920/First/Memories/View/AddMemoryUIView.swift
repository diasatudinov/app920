//
//  AddMemoryUIView.swift
//  app920
//
//  Created by Dias Atudinov on 11.09.2024.
//

import SwiftUI

struct AddMemoryUIView: View {
    @ObservedObject var viewModel: AttractionViewModel
    @State var attraction: Attraction
    @State var heading = ""
    @State var description = ""
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    @State var date = ""
    var customDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d h:mm a"
        return formatter
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.mainBg.ignoresSafeArea()
            
            VStack(spacing: 20) {
                VStack {
                    ZStack(alignment: .leading) {
                        if heading.isEmpty {
                            Text("Heading")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        
                        TextField("", text: $heading)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    
                    
                    
                    ZStack(alignment: .leading) {
                        if description.isEmpty {
                            Text("Description")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        TextField("", text: $description)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                }
                
                
                HStack {
                    Button {
                        isShowingImagePicker = true
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "paperclip")
                            Text("Attach photo")
                        }.foregroundColor(.white).font(.system(size: 15)).padding(9).background(Color.white.opacity(0.12)).cornerRadius(10)
                    }
                    Spacer()
                }
                
                if let selectedImage = selectedImage {
                    HStack {
                        Image(systemName: "doc.fill")
                            .foregroundColor(.white)
                        
                        VStack {
                            Text("Image 1.jpg")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                            Text(date)
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 11))
                        }
                        Spacer()
                        Button {
                            self.selectedImage = nil
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: 21, height: 21)
                                    .foregroundColor(.gray.opacity(0.2))
                                Image(systemName: "xmark")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 11))
                            }
                        }
                    }.padding(11).background(Color.white.opacity(0.12)).cornerRadius(9)
                }
                Spacer()
                
                Button {
                    if !heading.isEmpty && !description.isEmpty {
                        if let image = selectedImage {
                            let memory = Memory(heading: heading, description: description, imageData: image.jpegData(compressionQuality: 1.0))
                            viewModel.addMemory(attraction, memory)
                        } else {
                            let memory = Memory(heading: heading, description: description)
                            viewModel.addMemory(attraction, memory)
                        }
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 50)
                            .cornerRadius(16)
                            .foregroundColor((!heading.isEmpty && !description.isEmpty) ? .redBtn : .white.opacity(0.5))
                        Text("Save")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                }
                
            }.padding(.horizontal)
            
        }
        .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
        }.navigationTitle("New attraction")
    }
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
            print("Selected image size: \(selectedImage.description)")
            date = customDateFormatter.string(from: Date())
        }
    }
}

#Preview {
    AddMemoryUIView(viewModel: AttractionViewModel(), attraction: Attraction(name: "", country: "", city: "", cost: "", description: "", excursion: ""))
}

struct EditMemoryUIView: View {
    @ObservedObject var viewModel: AttractionViewModel
    @State var attraction: Attraction
    @State var memory: Memory
    @State var heading = ""
    @State var description = ""
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    @State var date = ""
    var customDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d h:mm a"
        return formatter
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.mainBg.ignoresSafeArea()
            
            VStack(spacing: 20) {
                VStack {
                    ZStack(alignment: .leading) {
                        if heading.isEmpty {
                            Text("Heading")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        
                        TextField("", text: $heading)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    
                    
                    
                    ZStack(alignment: .leading) {
                        if description.isEmpty {
                            Text("Description")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        TextField("", text: $description)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                }
                
                
                HStack {
                    Button {
                        isShowingImagePicker = true
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "paperclip")
                            Text("Attach photo")
                        }.foregroundColor(.white).font(.system(size: 15)).padding(9).background(Color.white.opacity(0.12)).cornerRadius(10)
                    }
                    Spacer()
                }
                
                if let selectedImage = selectedImage {
                    HStack {
                        Image(systemName: "doc.fill")
                            .foregroundColor(.white)
                        
                        VStack {
                            Text("Image 1.jpg")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                            Text(date)
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 11))
                        }
                        Spacer()
                        Button {
                            self.selectedImage = nil
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: 21, height: 21)
                                    .foregroundColor(.gray.opacity(0.2))
                                Image(systemName: "xmark")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 11))
                            }
                        }
                    }.padding(11).background(Color.white.opacity(0.12)).cornerRadius(9)
                }
                Spacer()
                
                Button {
                    if !heading.isEmpty && !description.isEmpty {
                        
                        viewModel.editMemory(for: attraction, memory: memory, image: selectedImage, heading: heading, description: description)
                        
                        
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 50)
                            .cornerRadius(16)
                            .foregroundColor((!heading.isEmpty && !description.isEmpty) ? .redBtn : .white.opacity(0.5))
                        Text("Save")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                }
                
            }.padding(.horizontal)
            
        }
        .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
        }.navigationTitle("New attraction")
            .onAppear() {
                heading = memory.heading
                description = memory.description
                selectedImage = memory.image
            }
    }
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
            print("Selected image size: \(selectedImage.description)")
            date = customDateFormatter.string(from: Date())
        }
    }
}

#Preview {
    EditMemoryUIView(viewModel: AttractionViewModel(), attraction: Attraction(name: "", country: "", city: "", cost: "", description: "", excursion: ""), memory: Memory(heading: "Mona Lisa", description: "asdsadasd sadsdadasd asdasdasd asdasdasd asdasdasd asdasdasd asdasdasd asdasdasd asdasd asdsadasd asdasdasd asdasd"))
}
