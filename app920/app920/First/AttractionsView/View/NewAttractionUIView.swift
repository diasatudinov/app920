//
//  NewAttractionUIView.swift
//  app920
//
//  Created by Dias Atudinov on 10.09.2024.
//

import SwiftUI

struct NewAttractionUIView: View {
    @ObservedObject var viewModel: AttractionViewModel
    @State var name = ""
    @State var country = ""
    @State var city = ""
    @State var cost = ""
    @State var description = ""
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    let filters = ["Historical", "Сultural", "Natural", "Architectural"]
    @State var selectedFilter: String?
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
                        if name.isEmpty {
                            Text("Name")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        
                        TextField("", text: $name)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    
                    ZStack(alignment: .leading) {
                        if country.isEmpty {
                            Text("Country")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        TextField("", text: $country)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    ZStack(alignment: .leading) {
                        if city.isEmpty {
                            Text("City")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        TextField("", text: $city)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    
                    ZStack(alignment: .leading) {
                        if cost.isEmpty {
                            Text("Cost")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        TextField("", text: $cost)
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
                    Text("Type of excursion")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(Range(0...filters.count - 1)) { index in
                            Text(filters[index])
                                .font(.system(size: 13))
                                .padding(12)
                                .foregroundColor(selectedFilter == filters[index] ? .red : .white.opacity(0.7))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(selectedFilter == filters[index] ? .red : .white.opacity(0.7), lineWidth: 1)
                                )
                                .onTapGesture {
                                    selectedFilter = filters[index]
                                }
                        }
                    }.padding(2)
                }
                HStack {
                    Button {
                        isShowingImagePicker = true
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "paperclip")
                            Text("Attach photo")
                        }.foregroundColor(.white).font(.system(size: 15)).padding(8).background(Color.white.opacity(0.12)).cornerRadius(10)
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
                    if !name.isEmpty && !country.isEmpty && !city.isEmpty && !cost.isEmpty && !description.isEmpty, let excursion = selectedFilter {
                        if let image = selectedImage {
                            let attraction = Attraction(name: name, country: country, city: city, cost: cost, description: description, excursion: excursion, imageData: image.jpegData(compressionQuality: 1.0))
                            viewModel.addAttraction(attraction)
                        } else {
                            let attraction = Attraction(name: name, country: country, city: city, cost: cost, description: description, excursion: excursion)
                            viewModel.addAttraction(attraction)
                        }
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 50)
                            .cornerRadius(16)
                            .foregroundColor((!name.isEmpty && !country.isEmpty && !city.isEmpty && !cost.isEmpty && !description.isEmpty && selectedFilter != nil) ? .redBtn : .white.opacity(0.5))
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
    NewAttractionUIView(viewModel: AttractionViewModel())
}

// MARK: - EditAttractionUIView

struct EditAttractionUIView: View {
    @ObservedObject var viewModel: AttractionViewModel
    @State var attraction: Attraction
    @State var name = ""
    @State var country = ""
    @State var city = ""
    @State var cost = ""
    @State var description = ""
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    let filters = ["Historical", "Сultural", "Natural", "Architectural"]
    @State var selectedFilter: String?
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
                        if name.isEmpty {
                            Text("Name")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        
                        TextField("", text: $name)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    
                    ZStack(alignment: .leading) {
                        if country.isEmpty {
                            Text("Country")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        TextField("", text: $country)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    ZStack(alignment: .leading) {
                        if city.isEmpty {
                            Text("City")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        TextField("", text: $city)
                            .padding()
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(10)
                    }
                    
                    ZStack(alignment: .leading) {
                        if cost.isEmpty {
                            Text("Cost")
                                .foregroundColor(Color.gray)
                                .padding(.leading)
                        }
                        TextField("", text: $cost)
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
                    Text("Type of excursion")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(Range(0...filters.count - 1)) { index in
                            Text(filters[index])
                                .font(.system(size: 13))
                                .padding(12)
                                .foregroundColor(selectedFilter == filters[index] ? .red : .white.opacity(0.7))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(selectedFilter == filters[index] ? .red : .white.opacity(0.7), lineWidth: 1)
                                )
                                .onTapGesture {
                                    selectedFilter = filters[index]
                                }
                        }
                    }.padding(2)
                }
                HStack {
                    Button {
                        isShowingImagePicker = true
                    } label: {
                        HStack(spacing: 0) {
                            Image(systemName: "paperclip")
                            Text("Attach photo")
                        }.foregroundColor(.white).font(.system(size: 15)).padding(8).background(Color.white.opacity(0.12)).cornerRadius(10)
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
                    if !name.isEmpty && !country.isEmpty && !city.isEmpty && !cost.isEmpty && !description.isEmpty, let excursion = selectedFilter {
                       
                        viewModel.editAttraction(for: attraction, image: selectedImage, name: name, country: country, city: city, cost: cost, description: description, excursion: excursion)
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 50)
                            .cornerRadius(16)
                            .foregroundColor((!name.isEmpty && !country.isEmpty && !city.isEmpty && !cost.isEmpty && !description.isEmpty && selectedFilter != nil) ? .redBtn : .white.opacity(0.5))
                        Text("Save")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                }
                
            }.padding(.horizontal)
            
        }
        .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
        }
        .navigationTitle("New attraction")
        .onAppear {
            name = attraction.name
            country =  attraction.country
            city =  attraction.city
            cost =  attraction.cost
            description =  attraction.description
            selectedImage = attraction.image
            selectedFilter = attraction.excursion
            
            
            
            
            
            
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
    EditAttractionUIView(viewModel: AttractionViewModel(), attraction: Attraction(name: "Louvre", country: "France", city: "Paris", cost: "30 $", description: "A palace with a large collection of works of art: from Roman sculptures to Leonardo da Vinci's Mona Lisa. A palace with a large collection of works of art: from Roman sculptures to Leonardo da Vinci's Mona Lisa A palace with a large collection of works of art: from Roman sculptures to Leonardo da Vinci's Mona Lisa", excursion: "Historical"))
}
