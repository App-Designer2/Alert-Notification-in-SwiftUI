//
//  ContentView.swift
//  LivingRooms
//
//  Created by luis reynaldo cedeno manzanilla on 22.07.19.
//  Copyright © 2019 App-Designer2. All rights reserved.
//

import SwiftUI
import Combine


struct ContentView : View {
    var livingRoom: Livingroom
   
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    var now = Date()
    @State var search = String()
    
    @State var selected = 0
    var isSelected = ["Execute","VIP","Familiar","Group"]
    
    var body: some View {
        NavigationView {
            List {
                SegmentedControl(selection: $selected) {
                    ForEach(0 ..< isSelected.count) { index in
                        Text(self.isSelected[index])
                        .tag(index)
                    }
                }
            
                HStack {
                    
                    Image(systemName: "magnifyingglass").font(.title)
                    
                    Group {
                    
                    TextField($search, placeholder: Text("search")).padding(10)
                        .foregroundColor(.black)
                        
                    }.background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }.padding(.trailing,5)
                
                //VStack(alignment: .leading) {
                    ForEach(livingData.identified(by: \.id)) { LivingRoom in
                       NavigationLink(destination: DetailView(detail: LivingRoom)) {
                            VStack(alignment: .leading) {
                                Image(LivingRoom.image)
                                .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 355, height: 210)
                                //.aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .shadow(radius: 1)
                                
                        
                            
                        VStack(alignment: .leading) {
                        HStack {
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            Image(systemName: "star").foregroundColor(.yellow)
                            
                            Spacer()
                            Text(LivingRoom.msg).color(.secondary)
                            Image(systemName: "bubble.left.fill").foregroundColor(.secondary)
                        }
                        
                        Text("\(self.now, formatter: Self.dateFormatter)").font(.caption)
                            .color(.secondary)

                        Text(LivingRoom.names).font(.subheadline)
                            .color(.primary)
                        .lineLimit(nil)
                        }
                       }.padding()
                  }
               }
            }.navigationBarTitle(Text("Livingrooms"))
            .navigationBarItems(trailing:
                    Image("Logo").resizable().clipShape(Circle()).frame(width: 35, height: 35))
                    
        }.colorScheme(.dark)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(livingRoom: livingData[2])
    }
}
#endif
