//
//  NetworkLogger.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//


import Foundation


class NetworkLogger {
    
    static func log(request: URLRequest) {
        #if DEBUG
        print("\n📤📤📤📤📤📤📤 OUTGOING REQUEST 📤📤📤📤📤📤📤")
        defer { print("📤📤📤📤📤📤📤 END REQUEST 📤📤📤📤📤📤📤\n") }

        let url = request.url?.absoluteString ?? "-"
        let components = URLComponents(string: url)
        let method = request.httpMethod ?? "-"
        let path = components?.path ?? "-"
        let query = components?.query.map { "?\($0)" } ?? ""
        let host = components?.host ?? "-"

        print("🔹 URL: \(url)")
        print("🔹 METHOD: \(method)")
        print("🔹 PATH: \(path)\(query)")
        print("🔹 HOST: \(host)")

        if let headers = request.allHTTPHeaderFields, !headers.isEmpty {
            print("🔹 HEADERS:")
            for (key, value) in headers {
                print("   \(key): \(value)")
            }
        }

        if let body = request.httpBody,
           let bodyString = String(data: body, encoding: .utf8), !bodyString.isEmpty {
            print("🔹 BODY:")
            print(bodyString)
        }
        #endif
    }
    
    static func log(response: HTTPURLResponse?, data: Data?, error: Error?) {
        #if DEBUG
        print("\n📥📥📥📥📥📥📥 INCOMING RESPONSE 📥📥📥📥📥📥📥")
        defer { print("📥📥📥📥📥📥📥 END RESPONSE 📥📥📥📥📥📥📥\n") }

        guard let response = response else {
            print("⚠️ No response received")
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
            }
            return
        }

        let url = response.url?.absoluteString ?? "-"
        let components = URLComponents(string: url)
        let path = components?.path ?? "-"
        let query = components?.query.map { "?\($0)" } ?? ""
        let host = components?.host ?? "-"

        print("🔸 URL: \(url)")
        print("🔸 STATUS CODE: \(response.statusCode)")
        print("🔸 PATH: \(path)\(query)")
        print("🔸 HOST: \(host)")

        if !response.allHeaderFields.isEmpty {
            print("🔸 HEADERS:")
            for (key, value) in response.allHeaderFields {
                print("   \(key): \(value)")
            }
        }

        if let data = data,
           let bodyString = String(data: data, encoding: .utf8), !bodyString.isEmpty {
            print("🔸 BODY:")
            print(bodyString)
        }

        if let error = error {
            print("❌ ERROR: \(error.localizedDescription)")
        }
        #endif
    }
}
