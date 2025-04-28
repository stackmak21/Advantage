//
//  HttpUrlResponseExtension.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

extension HTTPURLResponse{
    var isSuccess: Bool {
        return self.statusCode >= 200 && self.statusCode <= 299
    }
}
