//
//  InjuryDetailView.swift
//  FirstAidAssistant
//
//  Created by Madhur Gupta on 07/02/25.
//
import SwiftUI

struct InjuryDetailView: View {
    let injury: String
    @State private var isCompleted: Bool
    
    init(injury: String, isCompleted: Bool = false) {
        self.injury = injury
        self._isCompleted = State(initialValue: isCompleted)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(injury)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "#FF3B30")) // Deep red
                    .padding(.top)
                
                ForEach(1..<6) { step in
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Step \(step):")
                            .font(.headline)
                            .foregroundColor(Color(hex: "#5AC8FA")) // Soft blue
                        
                        Text("This is a placeholder step for \(injury).")
                            .font(.body)
                            .foregroundColor(.primary)
                        
                        Image(systemName: "cross.fill")
                            .font(.system(size: 50))
                            .foregroundColor(Color(hex: "#FF3B30")) // Deep red
                            .padding()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                }
                
                Button(action: {
                    isCompleted.toggle()
                }) {
                    Text(isCompleted ? "Completed ✅" : "Mark as Completed")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isCompleted ? Color(hex: "#34C759") : Color(hex: "#FF3B30")) // Green or red
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .background(Color(hex: "#F5F5F5")) // Light gray background
        .navigationTitle(injury)
    }
}
