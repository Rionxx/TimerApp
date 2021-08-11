//
//  ContentView.swift
//  TimerApp
//
//  Created by FX on 2021/08/11.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var count: Float = 0
    @State private var title = "Start Time"
    @State private var flag = false
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Timer:\(self.count, specifier: "%.1f")")
                    .frame(width: 200, height: 50)
                    .background(Color.orange)
                    .cornerRadius(20.0)
                    .onReceive(timer) { input in
                        if self.flag == true {
                            self.count += 0.1
                        }
                    }
                    .padding(.bottom, 75)
                
                Button(action: {
                    if self.flag == true {
                        self.title = "Start Time"
                        self.flag = false
                    }else{
                        self.title = "Stop Time"
                        self.flag = true
                    }
                }){
                    Text(self.title)
                }
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .cornerRadius(20.0)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

