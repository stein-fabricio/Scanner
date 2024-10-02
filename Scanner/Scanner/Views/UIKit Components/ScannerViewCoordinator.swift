//
//  ScannerViewBridge.swift
//  Scanner
//
//  Created by Stein on 02/10/24.
//

import SwiftUI

struct ScannerViewCoordinator: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        // do something
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(scannerViewBridge: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerViewBridge: ScannerViewCoordinator
        
        init(scannerViewBridge: ScannerViewCoordinator) {
            self.scannerViewBridge = scannerViewBridge
        }
        
    /// MVVM-C. UIVC talks to the Coordinator, Coordinator talks to SwiftUI view
        func didFind(barcode: String) {
            print("\(Self.self).\(#function).barcode: \(barcode)")
            scannerViewBridge.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            print("\(Self.self).\(#function).error: \(error.rawValue)")
            switch error {
            case .invalidDeviceInput:
                scannerViewBridge.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerViewBridge.alertItem = AlertContext.invalidScannedType
            }
            
        }
    }
}

#Preview {
    ScannerViewCoordinator(scannedCode: .constant(""), alertItem: .constant(nil))
}
