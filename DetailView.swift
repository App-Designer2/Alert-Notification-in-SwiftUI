//
//  DetailView.swift
//  LivingRooms
//
//  Created by luis reynaldo cedeno manzanilla on 22.07.19.
//  Copyright © 2019 App-Designer2. All rights reserved.
//

import SwiftUI

struct DetailView : View {
    @State private var isReserve: Bool = false
    @State private var isReserve0: Bool = false
    @State private var showAlert = false
    @State private var More = false
    
    @State private var isLiked0 = false
    @State private var isLiked1 = false
    @State private var isLiked2 = false
    @State private var isLiked3 = false
    @State private var isLiked4 = false
    
    @State private var isShowing = false
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    var now = Date()
    @State var selectedDate = Date()
    var detail: Livingroom
    var body: some View {
        List {
            ZStack(alignment: .bottom) {
                Image(detail.image)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .frame(height: 90)
                    .opacity(0.25)
                    .blur(radius: 8)
                    .contrast(15)
                
                
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(detail.detail)
                            .font(.largeTitle)
                            .color(.white)
                    }.padding(.leading).padding(.bottom)
                    Spacer()
                }
                
            }
            .listRowInsets(EdgeInsets())
            VStack(alignment: .leading) {
                HStack {
                    Button(action:
                        {
                            self.isLiked0.toggle()
                    }) {
                        Image(systemName: isLiked0 ?"star.fill": "star").foregroundColor(.orange)
                    }
                    
                    
                    Button(action:
                        {
                            self.isLiked1.toggle()
                    }) {
                        Image(systemName: isLiked1 ?"star.fill": "star").foregroundColor(.orange)
                    }
                    Button(action:
                        {
                            self.isLiked2.toggle()
                    }) {
                        Image(systemName: isLiked2 ?"star.fill": "star").foregroundColor(.orange)
                    }
                    Button(action:
                        {
                            self.isLiked3.toggle()
                    }) {
                        Image(systemName: isLiked3 ?"star.fill": "star").foregroundColor(.orange)
                    }
                    Button(action:
                        {
                            self.isLiked4.toggle()
                    }) {
                        Image(systemName: isLiked4 ?"star.fill": "star").foregroundColor(.orange)
                    }
                    
                    Spacer()
                    Text(detail.msg).font(.headline).color(.secondary)
                        //.presentation(isShowing, actionSheet: ContentView()) {
                    Image(systemName: "bubble.left.fill").foregroundColor(.gray)
                    
                }
                Text("\(now, formatter: Self.dateFormatter)").font(.caption)
                .color(.secondary)
                
                Text(detail.names).color(.primary).font(.body)
                    .lineLimit(nil)
                
            }
            Section {
                VStack(alignment: .leading) {
                    HStack {
                    Text("Following equipment is available to our guests to enjoy a comfortable stay:").bold().lineLimit(nil)
                    
                    Spacer()
                    
                
                        Button(action: {
                            self.More.toggle()
                        }) {
                            Text("More").color(.blue).underline()
                    }
                    }
                }
                    if More {
                        Text(detail.more).lineLimit(nil).font(.subheadline).foregroundColor(.orange)
                    
                }
                
            }
            if isReserve {
                DatePicker(
                    $selectedDate,
                    maximumDate: Date(),
                    displayedComponents: .date
                    
                )
            } else {
                Text("Reserve")
            }
        
            Section {
                HStack {
                    Text("Price per night:").color(.blue).bold()
                    Spacer()
                    Text("100€").strikethrough().font(.subheadline)
                    Text("75€").color(.green).underline()
                    Button(action: {
                        self.isReserve.toggle()
                    }) {
                        Text("Reserve").bold()
                            .color(.white).padding(10)
                    }.background(Color.orange)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                }
            }
            if isReserve0 {
                DatePicker(
                    $selectedDate,
                    maximumDate: Date(),
                    displayedComponents: .date
                    
                )
                
            } else {
                Text("Reserve")
            }
            
            Section {
                HStack {
                    Text("Price per month:").color(.blue).bold()
                    Spacer()
                    Text("2250€").strikethrough().font(.subheadline)
                    Text("1950€").color(.green).underline()
                    Button(action: {
                        self.isReserve0.toggle()
                    }) {
                        Text("Reserve").bold()
                            .color(.white).padding(10)
                    }.background(Color.orange)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                }
            }
            HStack {
                Text("Visit our site ->")
                Spacer()
                Text("www.livingrooms.de").color(.blue).underline()
            }
            VStack {
                HStack {
                    Spacer()
                    MapView()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 370,height: 210)
                    Spacer()
                }.padding(.top,70)
            }
            //            .navigationBarItems(leading:
            //                Button(action: {
            //                    self.isFavorite.toggle()
            //                })) {
            //                    Image(systemName: isFavorite ? "heart.fill" : "heart")
            //                        .foregroundColor(.orange)
            //            }
        }.edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        
        //            .onAppear(perform: showAlert)
        //            .presentation($$showAlert) {
        
        //}
        .colorScheme(.dark)
    }
}

#if DEBUG
struct DetailView_Previews : PreviewProvider {
    static var previews: some View {
        DetailView(detail: livingData[0])
    }
}
#endif
