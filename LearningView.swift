//
//  LearningView.swift
//  FirstAidAssistant
//
//  Created by Madhur Gupta on 07/02/25.
//
import SwiftUI

struct LearningView: View {
    let injuries = ["Burns", "Cuts", "Choking", "CPR", "Fractures", "Poisoning", "Allergies", "Heatstroke"]
    @State private var completedInjuries: Set<String> = []
    
    var body: some View {
        NavigationView { // Wrap in NavigationView
            ScrollView {
                VStack(spacing: 20) {
                    // Bandage Buddy Character with Animation
                    HStack {
                        Image(systemName: "bandage.fill")
                            .font(.system(size: 50))
                            .foregroundColor(Color(hex: "#FF3B30")) // Deep red
                            .rotationEffect(.degrees(20))
                            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: completedInjuries.count)
                        
                        Text("Hi, I'm Bandage Buddy!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "#5AC8FA")) // Soft blue
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
                    .padding(.horizontal)
                    
                    // Injury Modules
                    ForEach(injuries, id: \.self) { injury in
                        NavigationLink(destination: InjuryDetailView(injury: injury, isCompleted: completedInjuries.contains(injury))) {
                            HStack {
                                Image(systemName: completedInjuries.contains(injury) ? "checkmark.circle.fill" : "cross.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(completedInjuries.contains(injury) ? Color(hex: "#34C759") : Color(hex: "#5AC8FA")) // Green or blue
                                
                                Text(injury)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Quiz Section
                    NavigationLink(destination: QuizView()) {
                        Text("Take a Quiz")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "#FF3B30")) // Deep red
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .background(Color(hex: "#F5F5F5")) // Light gray background
            .navigationTitle("Learning")
        }
    }
}
