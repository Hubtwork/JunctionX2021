//
//  ChatRoom.swift
//  SMOO
//
//  Created by 허재 on 2021/05/22.
//

import SwiftUI

struct MainMenu: View {
    
    @State var isDrawerOpen: Bool = false
    
    let eventTitle: String
    
    /// Current Chat Channel Members
    let userList: UsersList
    
    /// Voice
    @State private var voiceStable: Bool = true
    let voiceTopicCount: Int = 17
    
    /// TextChat
    @State private var textHasNewContent: Bool = false
    let chatTopicCount: Int = 41
    
    /// Drive
    @State private var driveHasNewContent: Bool = true
    let driveFileCount: Int = 22
    
    /// GPS
    @State private var gpsOn: Bool = true
    
    var body: some View {
        content
        
    }
}

extension MainMenu  {
    
    var content: some View {
        ZStack {
            VStack(spacing: 0) {
                titleBar
                menu
            }.padding(.top, 50)
            
            if isDrawerOpen {
                Button(action: {
                    withAnimation {
                        isDrawerOpen = false
                    }
                }){
                    VStack {
                    }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                    .background(Color.gray.opacity(0.5))
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                    .animation(.easeInOut)
                }
            }
            ChatMembers(isOpen: $isDrawerOpen, groupName: "Junction X", userList: userList)
                .offset(x: isDrawerOpen ? 0: -300)
        }
    }
    
    var titleBar: some View {
        ZStack {
            HStack {
                Button(action: {
                    withAnimation {
                        isDrawerOpen = true
                    }
                } ) {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 20, height: 20)
                }.foregroundColor(Color.black)
                Spacer()
            }
            HStack {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .frame(width: 130, height: 37)
                
                Spacer()
            }
        }.padding(.leading, 20)
        .padding(.bottom, 10)
    }
    
    var menu: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                VStack{}.frame(height: 10)
                
                Button(action: { voiceStable.toggle() }) {
                    VoiceChatMenuButton(isOn: $voiceStable, topicCount: voiceTopicCount)
                        .frame(height: UIScreen.screenHeight * 0.2)
                }
                Button(action: { print("")}) {
                    TextChatMenuButton(hasNewContent: $textHasNewContent, topicCount: chatTopicCount)
                        .frame(height: UIScreen.screenHeight * 0.2)
                }
                
                Button(action: { print("") }) {
                    DriveMenuButton(hasNewContent: $driveHasNewContent, fileCount: driveFileCount)
                        .frame(height: UIScreen.screenHeight * 0.2)
                }
                
                Button(action: { gpsOn.toggle() }) {
                    MapMenuButton(gpsOn: $gpsOn)
                        .frame(height: UIScreen.screenHeight * 0.2)
                }
                
                VStack{}.frame(height: 20)
            }
        }.padding(.horizontal, 20)
        .ignoresSafeArea(.all, edges: [.bottom])
    }
    
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu(eventTitle: "JUNCTION X Seoul", userList: UsersList.mocked)
            .previewDevice("iPhone 12")
    }
}
