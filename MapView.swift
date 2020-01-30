//
//  MapView.swift
//  LivingRooms
//
//  Created by luis reynaldo cedeno manzanilla on 22.07.19.
//  Copyright © 2019 App-Designer2. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 49.460983,
            longitude: 11.061859
        )
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
    
}
#if DEBUG
struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

#endif
