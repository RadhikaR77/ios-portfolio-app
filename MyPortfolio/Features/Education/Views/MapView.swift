//
//  MapView.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var educationModel : [EducationModel] = []
    let onSelect: (EducationModel) -> Void
    @State private var cameraPosition: MapCameraPosition = .automatic


        var body: some View {
            Map {
                ForEach(educationModel) { place in
                    Annotation("",
                               coordinate: CLLocationCoordinate2D(latitude: place.instituteLatitude,
                                                                  longitude: place.instituteLongitude),
                               anchor: .bottom
                               
                    ){
                        VStack{
                            Image(systemName: "mappin.and.ellipse")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.red)
                            VStack(){
                                Text(place.institution)
                                    .font(.custom("Montserrat-Bold", size: 10))
                                Text(place.board)
                                    .font(.custom("Montserrat-Regular", size: 8))
                                Text("\(place.startDate)-\(place.endDate)")
                                    .font(.custom("Montserrat-Regular", size: 8))
                            }
                                
                        }.onTapGesture {
                            onSelect(place)
                        }
                            
                    }
                }
            }.onAppear {
                updateCamera()
            }
        }
    
    private func updateCamera() {
        let coordinates = educationModel.map {
            CLLocationCoordinate2D(
                latitude: $0.instituteLatitude,
                longitude: $0.instituteLongitude
            )
        }

        guard !coordinates.isEmpty else { return }

        let region = MKCoordinateRegion(
            center: coordinates[0],
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )

        cameraPosition = .region(region)
    }
}
