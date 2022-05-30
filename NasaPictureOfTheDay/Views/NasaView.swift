//
//  NasaView.swift
//  NasaPictureOfTheDay
//
//  Created by David Tacite on 24/05/2022.
//

import SwiftUI

struct NasaView: View {
    let nasaData = NasaData()
    @State var nasaAPOD: NasaAPOD?
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: nasaAPOD?.hdurl ?? "toto")) { phase in
              switch phase {
              case .empty:
                  Text("empty")
              case .success(let image):
                image
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .clipShape(RoundedRectangle(cornerRadius: 8))
              case .failure(let error):
                Spacer()
                VStack {
                  Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.orange)
                    Text(error.localizedDescription + (nasaAPOD?.url ?? "test"))
                    .font(.caption)
                    .multilineTextAlignment(.center)
                }
              @unknown default:
                EmptyView()
              }
            }
            .task {
                    nasaAPOD = await nasaData.fetchAPOD()
                }
            
        }

    }
}

struct NasaView_Previews: PreviewProvider {
    static var previews: some View {
Text("oto")    }
}
