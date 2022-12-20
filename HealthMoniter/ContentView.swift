//
//  ContentView.swift
//  HealthMoniter
//
//  Created by  on 11/21/22.
//

import SwiftUI
import Charts

//Menu View--------------------------------------------------

struct MenuView: View {
    @State var profileValue = ""
    var body: some View {
        
        NavigationView
        {
            VStack(alignment: .leading) {
                HStack {
                    NavigationLink()
                    {
                        profileScreen()
                    }label: {
                        Image(systemName: "person")
                            .imageScale(.large)
                        Text("Profile")
                            .foregroundColor(.theme.PopUpMenuIcons)
                        .font(.headline)
                    }
                }
                .padding(.top, 100)
                HStack {
                    NavigationLink()
                    {
                        settingsScreen()
                    }label: {
                        Image(systemName: "gearshape.fill")
                            .imageScale(.large)
                        Text("Settings")
                            .foregroundColor(.theme.PopUpMenuIcons)
                            .font(.headline)

                    }
                }
                .padding(.top, 30)
                HStack {
                    //....TBD
                }
                .padding(.top, 30)
                Spacer()
            }.padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.theme.MenuBackground)
                .edgesIgnoringSafeArea(.all)
        }
    }
}









//Main Content View-----------------------------------------
struct ContentView: View {
    @State var showMenu = false
    var body: some View {
        // Drag Gesture------------------------------------
        let dragLeft = DragGesture()
                    .onEnded {
                        if $0.translation.width < -100 {
                            withAnimation {
                                self.showMenu = false
                            }
                        }
                    }
// Start of display-------------------------------------------
        ZStack
        {
            VStack {
                TabView
                {
                    GeometryReader { geometry in
                        HStack
                        {
                            HomeView(showMenu: self.$showMenu)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .offset(x: self.showMenu ? geometry.size.width/1.5 : 0)
                                .disabled(self.showMenu ? true : false)
                        }
                        if self.showMenu {
                            HStack
                            {
                                MenuView()
                                    .frame(width: geometry.size.width/1.5)
                                    .transition(.move(edge: .leading))
                                Spacer()
                            }
                        }
                    }
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }.toolbarBackground(Color.theme.ToolbarColor, for: .tabBar)

                    .tag("HomeView")
                    
                    
                    Text("tab2")
                        .tabItem {
                            Label("Health", systemImage: "heart.fill")
                        }
                }.accentColor(Color.theme.TabAccent)
            }
        }.gesture(dragLeft)
    }
}










//Home View--------------------------------------------------
struct HomeView: View{
    @Binding var showMenu: Bool
    @State var selectedIndex = 0
    
    
    var body: some View
    {
        NavigationView{
            VStack
            {
                HStack
                {
                    Text("In Development")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding()

                
                List
                {
                    // First Button------------------------------------------
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.theme.ListItem1)
                        VStack
                        {
                            
                            HStack
                            {
                                Text("Example")
                                    .fontWeight(.bold)
                                Spacer()
                                
                                NavigationLink {
                                    homeListButtonOne()
                                } label: {
                                    Text("")
                                        .font(.largeTitle)
                                }
                                Image(systemName: "chevron.right")

                            }.padding(5)
                            
                            
                            HStack
                            {
                                Text("Display Information")
                                Spacer()
                            }
                            
                        }.padding(10)
                    }
                    Spacer()
                    // End of First button in list-----------------------

                    
                    
                    
                    // Start of Graph--------------------------------------------
                    VStack
                    {
                        Text("Average Daily Steps")
                            .font(.title3)
                            .fontWeight(.semibold)
                        var month = getMonth()
                        Chart{
                            
                            BarMark(x: .value("Mount", "\("a")"), y: .value("Value", 5))
                                .cornerRadius(5)
                            
                            BarMark(x: .value("Mount", "\("b")"), y: .value("Value", 5))
                                .cornerRadius(5)
                            BarMark(x: .value("Mount", "\("c")"), y: .value("Value", 5))
                                .cornerRadius(5)
                            BarMark(x: .value("Mount", "\("d")"), y: .value("Value", 5))
                                .cornerRadius(5)
                            BarMark(x: .value("Mount", "\("e")"), y: .value("Value", 5))
                                .cornerRadius(5)
                            BarMark(x: .value("Mount", "\("f")"), y: .value("Value", 5))
                                .cornerRadius(5)
                            BarMark(x: .value("Mount", "\(month)"), y: .value("Value", 5))
                                .cornerRadius(5)
                        }
                        
                        Picker("IDK", selection: $selectedIndex) {
                            Text("Days").tag(0)
                            Text("Weeks").tag(1)
                            Text("Months").tag(2)
                            Text("All").tag(3)
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                    
                    // End of graph in list-----------------------
                    ForEach(0..<50)
                    {i in
                        Rectangle()
                            .frame(height:300)
                    }
                }.listStyle(.plain)
                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Home")
            
            
            
            
            
            
        //ToolBar--------------------------------------------------------
            .toolbar(content: {
            //Tool bar leading-----------------------------------------
                ToolbarItemGroup(placement: .navigationBarLeading)
                {
                    Button(action: {
                        withAnimation {
                        self.showMenu.toggle()
                    }
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(Color.gray)
                            .font(.title)
                    })
                }
            //Tool bar trailing------------------------------------
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink {
                        profileScreen()
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                    }
                }
            //Tool bar trailing end--------------------------------------
            })
        //Tool bar end------------------------------------------------
        }
    }
}




func getMonth() -> String
{
    var date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "LLL"
    let monthString = dateFormatter.string(from: date)
    return monthString

}




//Preview Creator-------------------------------------------------------
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
