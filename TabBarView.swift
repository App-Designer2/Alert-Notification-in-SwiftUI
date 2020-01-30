//
//  TabBarView.swift
//  LivingRooms
//
//  Created by luis reynaldo cedeno manzanilla on 28.07.19.
//  Copyright © 2019 App-Designer2. All rights reserved.
//

import SwiftUI

struct TabBarView : View {
    var body: some View {
        TabbedView {
            ContentView(livingRoom: livingData[0])
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2")
                        Text("Apartaments")
                    }
            }.tag(0)
             
                Text("🤩").font(.largeTitle)
                .tabItem {
                    VStack {
                        Image(systemName: "gift.fill")
                        Text("Vouches")
                    }
            }.tag(1)
            
            Text("🤔").font(.largeTitle)
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }.tag(2)
        }.accentColor(.orange)
        .colorScheme(.dark)
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct TabBarView_Previews : PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
#endif
