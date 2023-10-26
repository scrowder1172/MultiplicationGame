//
//  ContentView.swift
//  MultiplicationGame
//
//  Created by SCOTT CROWDER on 10/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var answer: String = ""
    @State private var num1: Int = 1
    @State private var num2: Int = 1
    @State private var response: String = ""
    @State private var nextNumber: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .green], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Pick your number to practice:")
                        .font(.system(size: 30).bold())
                    VStack {
                        HStack {
                            ForEach(1..<5) { num in
                                MGButton(number: num) {
                                    num1 = num
                                    num2 = 1
                                    response = ""
                                }
                            }
                        }
                        HStack {
                            ForEach(5..<9) { num in
                                MGButton(number: num) {
                                    num1 = num
                                    num2 = 1
                                    response = ""
                                }
                            }
                        }
                        HStack {
                            ForEach(9..<13) { num in
                                MGButton(number: num) {
                                    num1 = num
                                    num2 = 1
                                    response = ""
                                }
                            }
                        }
                    }
                    Text("What is \(num1) x \(num2)?")
                        .font(.system(size: 30).bold())
                    HStack {
                        TextField("Answer", text: $answer)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .font(.system(size: 30))
                        Button{
                            checkAnswer()
                        } label: {
                            Text("CHECK")
                                .font(.system(size: 30).bold())
                        }
                    }
                    
                    HStack {
                        //Button("Next question!") { num2 += 1 }
                        Button("Suprise me!") { num2 = Int.random(in: 1...12) }
                    }
                    Text(response)
                    if nextNumber {
                        Button {
                            num1 += 1
                            num2 = 1
                            nextNumber = false
                        } label: {
                            Text("Ready for your next number?")
                        }
                    }
                }
                .onSubmit {
                    checkAnswer()
                }
            }
            .padding()
        }
        
    }
    
    func checkAnswer() {
        let answerInt: Int = Int(answer) ?? -1
        
        if answerInt == num1 * num2 {
            response = "You are correct!"
            if num2 < 12 {
                num2 += 1
            } else {
                response += " You've mastered your \(num1)'s multiplications!"
                nextNumber = true
            }
        } else {
            response = "I'm sorry, but the correct answer is: \(num1) x \(num2) = \(num1 * num2)"
        }
        
        answer = ""
        
    }
}

struct MGButton: View {
    let number: Int
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "\(number).circle")
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    ContentView()
}
