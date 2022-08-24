//
//  ContentView.swift
//  Game
//
//  Created by dhuha kaweyani on 15/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var PlayerOnePoints: Int = 0
    @State var PlayerTwoPoints: Int = 0
    @State var PlayerOneImage = "rock"
    @State var PlayerTwoImage = "rock"
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                Text("Player 1").font(.system(size: 30, weight: .heavy, design: .rounded)).foregroundColor(.red)
                Text("points: \(PlayerOnePoints)").font(.system(size: 20, weight: .semibold, design: .default))
                Spacer()
                Image(PlayerTwoImage)
                Spacer()
                Image(PlayerOneImage)
                    .onTapGesture {
                        let PlayerTwoTap = Int.random(in: 1...3)
                        PlayerTwoImage = image(PlayerTwoTap)
                        
                        let PlayerOneTap = Int.random(in: 1...3)
                        PlayerOneImage = image(PlayerOneTap)
                        calculatePoints(PlayerOneTap, PlayerTwoTap)
                    }
                Spacer()
                Text("player 2").font(.system(size: 30, weight: .heavy, design: .rounded)).foregroundColor(.green)
                Text("points: \(PlayerTwoPoints)").font(.system(size: 20, weight: .semibold, design: .default))
                
                
                
            }
        }
    }
    func image(_ num : Int) -> String {
        if num == 1 {
            return "rock"
        }else if num == 2{
            return "paper"
        }else if num == 3{
            return "siscossers"
        }
        return "rock"
    }
    
    func calculatePoints(_ playerTwo: Int, _ PlayerOne: Int) {
        if playerTwo == 1 && PlayerOne == 2 {
            PlayerOnePoints = PlayerOnePoints + 1
        }
        if playerTwo == 1 && PlayerOne == 3 {
            PlayerTwoPoints = PlayerTwoPoints + 1
        }
        if playerTwo == 2 && PlayerOne == 1 {
            PlayerTwoPoints = PlayerTwoPoints + 1
        }
        if playerTwo == 2 && PlayerOne == 3 {
            PlayerOnePoints = PlayerOnePoints + 1
        }
        if playerTwo == 3 && PlayerOne == 1 {
            PlayerOnePoints = PlayerOnePoints + 1
        }
        if playerTwo == 3 && PlayerOne == 2 {
            PlayerTwoPoints = PlayerTwoPoints + 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
