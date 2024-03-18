//
//  ContentView.swift
//  StickyHeader2.0
//
//  Created by David on 3/18/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
   

    var body: some View {
        ScrollView{
            VStack{
                imageView()
                GeometryReader { geo in
                    let minY = geo.frame(in: .global).minY
                    HStack{
                        Button {
                            
                        } label: {
                            Label("Email", systemImage: "message")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.black)
                                .frame(width: 240, height: 45)
                                .background(
                                    .ultraThinMaterial, in:RoundedRectangle(cornerRadius: 30)
                                )
                        }

                        Cbutton(iconName: .in, action: {})
                        Cbutton(iconName: .x, action: {})
                    }
                    .frame(maxWidth: .infinity)
                    .offset(y: max(60 - minY, 0))
                }
                .offset(y: -50)
                .zIndex(1)
                GridView()
            }
        }
        .ignoresSafeArea()
    }

    
}

#Preview {
    ContentView()
       
}

@ViewBuilder
func imageView() -> some View {
    GeometryReader { geo in
        let minY = geo.frame(in: .global).minY
        let isScrolling = minY > 0
        VStack{
            Image(.realstate)
                .resizable()
                .scaledToFill()
                .frame(height: isScrolling ? 160 + minY : 160)
                .clipped()
                .offset(y: isScrolling ? -minY : 0)
                .blur(radius: isScrolling ? 0 + minY / 80 : 0)
                .scaleEffect(isScrolling ? 1 + minY / 2000 : 1)
                .overlay(alignment: .bottom) {
                    ZStack{
                        Image(.realstate)
                            .resizable()
                            .scaledToFill()
                        Circle().stroke(lineWidth: 6)
                    }
                    .frame(width: 110, height: 110)
                    .clipShape(Circle())
                    .offset(y: 50)
                    .offset(y: isScrolling ? -minY : 0)
                }
            Group{
                VStack{
                    Text("DLEYVAA")
                        .bold()
                        .font(.title)
                    Text("I started learning swiftui a year and a half ago, and i loved it very much, I like sharing what i learned on Youtube")
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .frame(width: geo.size.width - 30)
                        .lineLimit(3)
                        .fixedSize()
                }
                .offset(y: isScrolling ? -minY : 0)
            }
            .padding(.vertical, 53)
        }
    }
    .frame(height: 385)
    
}


struct GridView: View {
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
            ForEach(0 ..< 25){ item in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 180, height: 220)
                    .foregroundStyle(.ultraThinMaterial)
            }
        }
        .padding(.horizontal,10)
    }
}

struct Cbutton: View {
    let iconName: UIImage
    var action:()-> Void
    
    var body: some View {
        Button{
            action()
        }label: {
            Image(uiImage: iconName)
                .resizable()
                .scaledToFill()
                .frame(width: 23, height: 23)
                .padding(10)
                .background(.ultraThinMaterial, in: Circle())
                .overlay {
                    Circle().stroke(lineWidth: 1)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .bottomLeading, endPoint: .topTrailing))
                }
        }
    }
}
