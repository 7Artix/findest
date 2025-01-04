//
//  ContentView.swift
//  Findest
//
//  Created by Artix Zhang on 2025/1/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            HStack {
                VStack {
                    FolderView(folderPath: "/")
                    FolderView(folderPath: "/Applications")
                }
                VStack {
                    FolderView(folderPath: "/Users")
                    FolderView(folderPath: "/Library")
                }
            }
            .padding()
        }
}

struct FolderView: View {
    let folderPath: String
    var body: some View {
            VStack {
                Text("Folder: \(folderPath)")
                    .font(.headline)
                List {
                    ForEach(fileList(), id: \.self) { file in
                        Text(file)
                    }
                }
                .listStyle(PlainListStyle())
                .cornerRadius(10)
                //.padding(1)
                //.shadow(radius: 10)
            }
            .frame(minWidth: 200, minHeight: 200)
            //.border(Color.gray)
        }
    func fileList() -> [String] {
            do {
                return try FileManager.default.contentsOfDirectory(atPath: folderPath)
            } catch {
                return ["Error loading folder"]
            }
        }
}

#Preview {
    ContentView()
}
