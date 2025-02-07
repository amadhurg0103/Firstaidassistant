//
//  HomeView.swift
//  FirstAidAssistant
//
//  Created by Madhur Gupta on 07/02/25.
//
import SwiftUI

struct HomeView: View {
    let majorInjuries = ["Burns", "Cuts", "Choking", "CPR", "Fractures", "Poisoning"]
    let minorInjuries = ["Sprains", "Nosebleeds", "Insect Bites", "Electric Shock", "Hypothermia", "Stroke"]
    let emergencyContacts = [("Ambulance", "102"), ("Fire", "101"), ("Poison", "112")]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                HStack {
                    // App Name and Bandage Buddy
                    HStack {
                        Image(systemName: "bandage.fill")
                            .font(.system(size: 40))
                            .foregroundColor(Color(hex: "#FF3B30")) // Deep red
                        
                        Text("Aid+")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "#5AC8FA")) // Soft blue
                    }
                    
                    Spacer()
                    
                    // Emergency Phone Button
                    Button(action: {
                        // Navigate to emergency contacts
                    }) {
                        Image(systemName: "phone.fill")
                            .font(.system(size: 25))
                            .foregroundColor(Color(hex: "#FF3B30")) // Deep red
                    }
                    
                    // Profile Button
                    Button(action: {
                        // Action for profile
                    }) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(Color(hex: "#5AC8FA")) // Soft blue
                    }
                }
                .padding(.horizontal)
                
                // Search Bar
                HStack {
                    TextField("Search", text: .constant(""))
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                    
                    Button(action: {
                        // Action for search
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 20))
                            .foregroundColor(Color(hex: "#5AC8FA")) // Soft blue
                    }
                }
                .padding(.horizontal)
                
                // Emergency Contacts (Moved to the top)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Emergency Contacts")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "#FF3B30")) // Deep red
                        .padding(.horizontal)
                    
                    ForEach(emergencyContacts, id: \.0) { contact in
                        Button(action: {
                            if let url = URL(string: "tel://\(contact.1)") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack {
                                Text(contact.0)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Text(contact.1)
                                    .font(.subheadline)
                                    .foregroundColor(Color(hex: "#FF3B30")) // Deep red
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Major Injuries Carousel
                VStack(alignment: .leading, spacing: 10) {
                    Text("Major Injuries")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "#FF3B30")) // Deep red
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(majorInjuries, id: \.self) { injury in
                                NavigationLink(destination: InjuryDetailView(injury: injury)) {
                                    InjuryCard(title: injury, color: Color(hex: "#FF3B30")) // Deep red
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Minor Injuries Grid
                VStack(alignment: .leading, spacing: 10) {
                    Text("Minor Injuries")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "#5AC8FA")) // Soft blue
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 15) {
                        ForEach(minorInjuries, id: \.self) { injury in
                            NavigationLink(destination: InjuryDetailView(injury: injury)) {
                                InjuryCard(title: injury, color: Color(hex: "#5AC8FA")) // Soft blue
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .background(Color(hex: "#F5F5F5")) // Light gray background
        .navigationTitle("")
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure content fits within screen
    }
}

// Injury Card Component
struct InjuryCard: View {
    let title: String
    let color: Color
    
    var body: some View {
        VStack {
            Image(systemName: "cross.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Circle())
                .shadow(color: color.opacity(0.3), radius: 10, x: 0, y: 5)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.top, 5)
        }
        .frame(width: 150, height: 150)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}
