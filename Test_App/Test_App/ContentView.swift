//
//  ContentView.swift
//  Test_App
//
//  Created by Софья Норина on 13.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            navigationBar
            stories
            post
            Spacer()
        }
    }
    var navigationBar: some View {
        HStack{
            Image("Instagram")
            Spacer()
            HStack(spacing: 26){
                Button(action: {}){ Image("iconNewPhoto")}
                Button(action: {}){ Image("iconLike")}
                Button(action: {}){ Image("iconDirect")}
            }
        }
        .padding(.horizontal, 20)
    }
}

let storyCollections: [StoryCollection] = [
     .init(title: "mex", thumbnail: Image("1")),
     .init(title: "mex", thumbnail: Image("1")),
     .init(title: "mex", thumbnail: Image("1")),
     .init(title: "mex", thumbnail: Image("1")),
     .init(title: "mex", thumbnail: Image("1")),
     .init(title: "mex", thumbnail: Image("1")),
     .init(title: "mex", thumbnail: Image("1")),
    ]

var stories: some View{
    ScrollView(.horizontal, showsIndicators: false){
        HStack{
            ForEach(storyCollections){ storyCollection in
                StoryCollectionView(storyCollection: storyCollection)
            }
        }
    }
}
var post: some View{
    PostView()
}
struct PostView: View {
    var body: some View {
        VStack(spacing: 0){
            header
            content
            actions
            liked
            caption
        }
    }
    var header: some View {
        HStack{
            Image("1")
                .resizable()
                .frame(width: 32,height: 32)
                .clipped()
                .scaledToFill()
                .cornerRadius(100)
            VStack(alignment: .leading){
                Text("mex")
                    .font(.system(size: 13.5, weight: .medium ))
                Text("Florence, Italy")
                    .font(.system(size: 11.5, weight: .regular ))
            }
            Spacer()
            Button(action: {}){ Image("iconThreeDot") .resizable() .frame(width: 25, height: 25)}
        }
        .padding(10)
    }
    var content: some View {
        TabView {
            Image("2")
                .resizable()
                .scaledToFill()
                .frame(width: 414,height: 414)
                .clipped()
            Image("1")
                .resizable()
                .scaledToFill()
                .frame(width: 414,height: 414)
                .clipped()
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
    var actions: some View {
        HStack{
            Button(action: {}){ Image("iconLike")}
            Button(action: {}){ Image("iconComent")}
            Button(action: {}){ Image("iconDirect")}
            Spacer()
            Button(action: {}){ Image("iconBookmark")}
        }
        .padding(.horizontal, 10)
    }
    var liked: some View {
        HStack(spacing: 5){
            HStack(spacing: -10){
                CircleImageView(imageName: "1")
                CircleImageView(imageName: "2")
                CircleImageView(imageName: "1")
            }
            Text("Liked by ").font(.system(size: 13.5, weight: .regular))
            +
            Text("mex ").font(.system(size: 13.5, weight: .medium))
            +
            Text("and ").font(.system(size: 13.5, weight: .regular))
            +
            Text("other").font(.system(size: 13.5, weight: .medium))
            Spacer()
        }
        .padding(5)
    }
    var caption: some View {
        HStack{
            Text("mex ").font(.system(size: 13.5, weight: .medium))
            +
            Text("Very bad boy  🦝").font(.system(size: 13.5, weight: .regular))
            +
            Text("#racoon #badboy").font(.system(size: 13.5, weight: .regular))
            .foregroundColor(.blue)
            Spacer()
        }
        .padding(10)
        
    }
}

struct CircleImageView: View {
    var imageName: String
    var body: some View{
        ZStack{
            Circle()
                .fill(Color.white)
            Image(imageName)
                .resizable()

                .cornerRadius(100)
                .padding(2)
        }
        .frame(width: 32,height: 32)
    }
}

struct StoryCollection: Identifiable{
    var id: String{
            title
    }
    let title: String
    let thumbnail: Image
}
struct StoryCollectionView: View {
    let storyCollection: StoryCollection
    
    var body: some View {
        ZStack{
//            Circle()
//                .strokeBorder(lineWidth: 20)
//                .foregroundColor(.red)
                storyCollection.thumbnail
                .resizable()
                .frame(width: 66,height: 66)
                .clipped()
                .scaledToFill()
                .cornerRadius(100)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
