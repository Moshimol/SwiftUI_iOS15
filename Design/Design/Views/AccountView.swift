//
//  AccountView.swift
//  Design
//
//  Created by lushitong on 2022/4/17.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPin = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                profile
                
                menu
                
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done").bold()
            })
        }
    }
    
    
    var profile: some View {
        VStack (spacing: 8.0) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            Text("Lu Shitong")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                Text("China")
                    .foregroundColor(.secondary)
                
            }
        }
        .frame(maxWidth:.infinity)
        .padding()
    }
    
    var menu : some View {
        Section {
            NavigationLink(destination: HomeView()) {
                Label("Settings", systemImage: "gear")
            }
            
            NavigationLink {
                Text("Billing")
            } label: {
                Label("Billing",systemImage: "creditcard")
            }
            
            NavigationLink{HomeView()} label: {
                Label("Help", systemImage: "questionmark")
            }
            
            
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links : some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://www.bilibili.com/")! ) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button(action: {
                        isDeleted = true
                    }, label: {
                        Label("Delete",systemImage: "trash")
                        
                    })
                    .tint(.red)
                    
                    pinButton
                    
                }
            }
            
            
            Link(destination: URL(string: "http://baidu.com/")! ) {
                HStack {
                    Label("Baidu", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    
    var pinButton : some View {
        Button {
            isPin.toggle()
        } label: {
            Label("Pin",systemImage: !isPin ? "pin" : "pin.slash")
        }
        .tint(isPin ? .gray : .yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
