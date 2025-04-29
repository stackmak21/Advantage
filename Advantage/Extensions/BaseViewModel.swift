//
//  BaseViewModel.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import Foundation

@MainActor
protocol BaseViewModel: ObservableObject{
    var isLoading: Bool { get set }
    
    func setLoading()
    func resetLoading()
}


extension BaseViewModel {
    
    func setLoading(){
        isLoading = true
    }
    
    func resetLoading(){
        isLoading = false
    }
}
