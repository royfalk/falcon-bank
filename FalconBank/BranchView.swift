//
//  BranchView.swift
//  FalconBank
//
//  Created by Roy Falk on 30/04/2023.
//

import SwiftUI
import CoreLocation
import MapKit

let origin: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 32.120895, longitude: 34.829545)
let center = CLLocationCoordinate2D(latitude: 32.120895, longitude: 34.829545)
let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)

struct BranchView: View {
    @State var region: MKCoordinateRegion
    @State var branches: [Branch]
    @State var bottom: Bool = true
    
    init(branches: [Branch]) {
        
        region = MKCoordinateRegion(center: center, span: span)
        
        self.branches = branches
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: branches) {
                branch -> MapMarker in
                MapMarker(coordinate: branch.location.coordinate)
            }
            
            if bottom {
                Button("Home") {
                    
                }
            }
        }
        
    }
}

struct BranchView_Previews: PreviewProvider {
    static var previews: some View {
        BranchView(branches: mockBranches)
    }
}
