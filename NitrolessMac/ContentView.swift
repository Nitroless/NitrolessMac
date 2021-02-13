//
// ContentView.swift
// NitrolessMac
//
// Created by e b on 12.02.21
//

import SwiftUI

struct CoolButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? CGFloat(0.85) : 1.0)
            .rotationEffect(.degrees(configuration.isPressed ? 0.0 : 0))
            .blur(radius: configuration.isPressed ? CGFloat(0.0) : 0)
            .animation(Animation.spring(response: 0.35, dampingFraction: 1, blendDuration: 0))
            .padding(.bottom, 3)
    }
}

var emotes: [String: String] = [
    "sad": "https://github.com/TheAlphaStream/nitroless-assets/blob/main/assets/sad.png?raw=true",
    "goshimgay": "https://github.com/TheAlphaStream/nitroless-assets/blob/main/assets/goshimgay.png?raw=true",
    "hug": "https://github.com/TheAlphaStream/nitroless-assets/blob/main/assets/hug.png?raw=true",
    "heart_trans":"https://github.com/TheAlphaStream/nitroless-assets/blob/main/assets/heart_trans.png?raw=true",
    "kekw":"https://github.com/TheAlphaStream/nitroless-assets/blob/main/assets/kekw.png?raw=true",
    "heyurcute":"https://github.com/TheAlphaStream/nitroless-assets/blob/main/assets/heyurcute.png?raw=true",
    "fail":"https://github.com/TheAlphaStream/nitroless-assets/blob/main/assets/02fail.png?raw=true",
    "fr": "https://github.com/TheAlphaStream/nitroless-assets/blob/main/assets/fr.png?raw=true",
    "vibeok": "https://github.com/TheAlphaStream/nitroless-assets/blob/main/assets/vibeok.png?raw=true",
    "where": "https://github.com/TheAlphaStream/nitroless-assets/blob/main/assets/where.png?raw=true",
    "troll": "https://github.com/TheAlphaStream/nitroless-assets/blob/main/assets/troll.png?raw=true"
]

struct ContentView: View {
    let pasteboard = NSPasteboard.general

    var columns: [GridItem] = [
        GridItem(spacing: 20),
        GridItem(spacing: 20),
        GridItem(spacing: 20)
    ]
    @Environment(\.openURL) var openURL
    @State var currentViewSeen: Int = 0
    @State var title: String = "Nitroless"
    @State var recentsenabled = true
    @State var searchenabled = true
    var body: some View {
        VStack{
            ScrollView {
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    if currentViewSeen != 0 {
                        Button(action: {
                            currentViewSeen = 0
                            title = "Nitroless"
                        }) {
                            Image(systemName: "star.fill")
                                .font(.title)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    if currentViewSeen != 1 {
                        Button(action: {
                            currentViewSeen = 1
                            title = "Credits"
                        }) {
                            Image(systemName: "sparkles")
                                .font(.title)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    if currentViewSeen != 2 {
                        Button(action: {
                            currentViewSeen = 2
                            title = "Settings"
                        }) {
                            Image(systemName: "gearshape.fill")
                                .font(.title)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    if currentViewSeen != 3 && searchenabled == true {
                        Button(action: {
                            currentViewSeen = 3
                            title = "Search"
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                
                if currentViewSeen == 0 {
                    LazyVGrid(columns: columns) {
                        ForEach(emotes.sorted(by: >), id: \.key) { emote, key in
                            Button(action: {
                                pasteboard.clearContents()
                                pasteboard.setString(key, forType: NSPasteboard.PasteboardType.string)
                            }) {
                                VStack {
                                    Image(emote).resizable()
                                        .frame(width: 48, height: 48)
                                        .scaledToFit()
                                        .cornerRadius(2)
                                    Text(emote)
                                        .font(.caption)
                                        .foregroundColor(.primary)
                                }
                            }
                            .buttonStyle(CoolButtonStyle())

                        }
                    }
                }
                if currentViewSeen == 1 {
                    VStack(alignment: .leading) {
                        Button(action: {
                            guard let url = URL(string: "https://twitter.com/Alpha_Stream") else { return }
                            openURL(url)
                        }) {
                            HStack {
                                Image(systemName: "link")
                                Divider()
                                Text("TheAlpha_Stream ~ Site  ")
                                Spacer()
                            }
                        }
                        .padding(10)
                        .frame(width: 220)
                        .background(Color.secondary.colorInvert())
                        .buttonStyle(BorderlessButtonStyle())
                        .cornerRadius(10)
                    }
                    .padding(.top, 15)
                    VStack(alignment: .leading) {
                        Button(action: {
                            guard let url = URL(string: "https://twitter.com/elihweilrahc13") else { return }
                            openURL(url)
                        }) {
                            HStack {
                               Image(systemName: "link")
                               Divider()
                               Text("Amy ~ iOS App and Parser")
                            }
                        }
                        .padding(10)
                        .frame(width: 220)
                        .background(Color.secondary.colorInvert())
                        .buttonStyle(BorderlessButtonStyle())
                        .cornerRadius(10)
                    }
                    VStack(alignment: .leading) {
                        Button(action: {
                            guard let url = URL(string: "https://twitter.com/a1thio") else { return }
                            openURL(url)
                        }) {
                            HStack {
                                Image(systemName: "link")
                                Divider()
                                Text("althio ~ macOS App        ")
                                Spacer()
                            }
                        }
                        .padding(10)
                        .frame(width: 220)
                        .background(Color.secondary.colorInvert())
                        .buttonStyle(BorderlessButtonStyle())
                        .cornerRadius(10)
                        
                    }
                }
                if currentViewSeen == 2 {
                    VStack {
                        HStack {
                            Text("Recents")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            Toggle(isOn: $recentsenabled) {
                            }
                            .toggleStyle(SwitchToggleStyle())
                        }
                        .padding(.top)
                        HStack {
                            Text("Search")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            Toggle(isOn: $searchenabled) {
                            }
                            .toggleStyle(SwitchToggleStyle())
                        }
                    }
                }
            }

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}