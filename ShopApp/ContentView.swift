//
//  ContentView.swift
//  ShopApp
//  Created by Fadi on 22/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectIndex : Int = 0
    private let categories = ["All","Chair","Table","Bed","Lamp","Kitchen" ]
      
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment:.leading){
                    AppBarView()
                    TagLineView()
                        .padding()
                    SearchView()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(0 ..< categories.count) { i in
                                CategoryView(isActive: i == selectIndex, text: categories[i])
                                    .onTapGesture {
                                        selectIndex = i
                                    }
                            }
                            
                        }.padding()
                    }
                    Text("Popular")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image ("chair_\(index + 1)"), size: 210)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    
                    Text("Best")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image ("chair_\(index + 1)"), size: 180)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                
                }
            }
            
            //Navigation Bar
            HStack{
            
                BottomNavBar(image: Image("Home")) {}
                BottomNavBar(image: Image("User"))  {}
                BottomNavBar(image: Image("User")) {}
                BottomNavBar(image: Image("User")) {}
           
        }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
            .frame(maxHeight:.infinity,alignment: .bottom)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct AppBarView: View {
    
    var body: some View {
        HStack{
            Button(action: {}){
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            Spacer()
            
            Button(action: {}){
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10)
                
            }
        }.padding(.horizontal)
    }
}



struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.largeTitle)
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}

struct SearchView: View {
    @State private var search:String = ""
    var body: some View {
        HStack {
            HStack{
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(50)
            .padding(.horizontal)
            
        }
    }
}

struct CategoryView: View {
    let isActive : Bool
    let text : String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.5))
             
            if (isActive){ Color("Primary")
                .frame(width: 15, height:2 )
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct  ProductCardView: View {
    let image : Image
    let size : CGFloat
    
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20)
            
            Text("Luxury Sweedian Chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing:2){
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                
                Text("1300 EGP")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
        }
        .frame(width:size)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct BottomNavBar: View {
    let image : Image
    let action : ()-> Void
    var body: some View {
        HStack{
            Button(action: action, label: {
                image
                    .frame(maxWidth:.infinity)
            })
            
            
        }
        
    }
}
