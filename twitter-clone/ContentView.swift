//
//  ContentView.swift
//  twitter-clone
//
//  Created by Pearl on 9/20/19.
//  Copyright © 2019 Pearl. All rights reserved.
//

import SwiftUI

struct Tweet: Hashable, Identifiable {
  var id: UUID
  let message, time, date, handle, name, avatar, commentCount: String
  let imageName: String?

    init(message: String,  time: String, date: String, handle: String, name: String, avatar: String, commentCount: String, imageName: String? = nil) {
    self.id = UUID()
    self.message = message
    self.time = time
    self.date = date
    self.handle = handle
    self.name = name
    self.avatar = avatar
    self.commentCount = commentCount
    self.imageName = imageName
  }
}


struct ContentView: View {
    let tweets: [Tweet] = [
        Tweet(message: "If you use Python on a daily basis, you're gonna want to know all its secrets. So heres an A-Z list of useful Python tricks to help you get the most out of the language.", time: "8:03 AM", date: "Sept 21, 2019", handle: "@freeCodeCamp", name: "freeCodeCamp.com", avatar: "fcc", commentCount: "2", imageName: "fcc-2"),
        Tweet(message: "Ovandi’s Founder Wants To Transform Vaping", time: "6:03 AM", date: "Sept 10, 2019", handle: "@AfroTech", name: "afrotech", avatar: "afrotech-2", commentCount: "21", imageName: "afro-img"),
        Tweet(message: "OMG! OMG! OMG! My opera is coming to the Met!!!! “In its 136-year history, the Metropolitan Opera has never staged an opera by a blk composer. But that will finally change: The company said on Thursday that it would present ‘Fire Shut Up in My Bones,’...”", time: "2:03 PM", date: "Sept 1, 2019", handle: "@CharlesMBlock", name: "Charles M. Blow", avatar: "cmb", commentCount: "45"),
         Tweet(message: "Rust is both performant and expressive - not something you find in every programming language. In this comprehensive tutorial, you'll learn how to build powerful GraphQL servers with Rust.", time: "8:03 AM", date: "Sept 21, 2019", handle: "@freeCodeCamp", name: "freeCodeCamp.com", avatar: "fcc", commentCount: "2", imageName: "gears"),
         Tweet(message: "Mimconnect Started as a Group Chat. Now It’s One of the Premiere Platforms for Diverse Media Professionals", time: "6:03 AM", date: "Sept 10, 2019", handle: "@AfroTech", name: "afrotech", avatar: "afrotech-2", commentCount: "21", imageName: "afro-img2"),
    ]

    struct IfLet<T, Out: View>: View {
      let value: T?
      let produce: (T) -> Out

      init(_ value: T?, produce: @escaping (T) -> Out) {
        self.value = value
        self.produce = produce
      }

      var body: some View {
        Group {
          if value != nil {
            produce(value!)
          }
        }
      }
    }
    
    var body: some View {
        ScrollView {
//            VStack {
                ForEach(tweets, id: \.self) { tweet in
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(tweet.avatar)
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 50, height: 50)
                                
                                VStack(alignment: .leading) {
                                    Text(tweet.name).bold().fixedSize()
                                    Text(tweet.handle).font(.subheadline)
                                }
                                Spacer()
                                Image("twitter")
                                   .resizable()
                                   .clipShape(Circle())
                                    .frame(width: 30, height: 30)
                            }
                            HStack {
                                Text(tweet.message)
                                 .fixedSize(horizontal: false, vertical: true)
                            }
                            HStack {
                                IfLet(tweet.imageName) { imageName in
                                     Image(imageName)
                                    .resizable()
                                    .frame(width: 350, height: 300)
                                   }
                            }
                            HStack {
                                Image("comment")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text(tweet.commentCount)
                                Text(tweet.time)
                                Text(tweet.date)
                                Spacer()
                                Image("info")
                                     .resizable()
                                    .frame(width: 15, height: 15)
                            }
                        }.padding().border(Color.gray)
                    }.padding()
                }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
