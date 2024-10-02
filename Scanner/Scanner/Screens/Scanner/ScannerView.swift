//
//  ContentView.swift
//  Scanner
//
//  Created by Stein on 30/09/24.
//

import SwiftUI
import SwiftData

struct ScannerView: View {
    
    @StateObject var viewModel = ScannerViewModel() /// new viewModel? StateObject. Passing along? ObservedObject
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerViewCoordinator(scannedCode: $viewModel.scannedCode,
                                       alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned: ", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()

            }
            .navigationTitle("Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    ScannerView()
}
