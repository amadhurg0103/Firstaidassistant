//
//  QuizView.swift
//  FirstAidAssistant
//
//  Created by Madhur Gupta on 07/02/25.
//


import SwiftUI

struct QuizView: View {
    @State private var selectedAnswer: Int? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Quiz Time!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "#FF3B30")) // Deep red
                .padding(.top)
            
            Text("What is the first step for treating burns?")
                .font(.title2)
                .foregroundColor(.primary)
                .padding()
            
            VStack(spacing: 10) {
                ForEach(0..<4) { index in
                    Button(action: {
                        selectedAnswer = index
                    }) {
                        Text("Option \(index + 1)")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedAnswer == index ? (index == 0 ? Color(hex: "#34C759") : Color(hex: "#D32F2F")) : Color(hex: "#5AC8FA")) // Green, red, or blue
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color(hex: "#F5F5F5")) // Light gray background
        .navigationTitle("Quiz")
    }
}