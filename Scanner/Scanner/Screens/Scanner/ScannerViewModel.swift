//
//  ScannerViewModel.swift
//  Scanner
//
//  Created by Stein on 02/10/24.
//

import SwiftUI

final class ScannerViewModel: ObservableObject {
    
    @Published var scannedCode: String = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not yet scanned" : "\(scannedCode)"
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
