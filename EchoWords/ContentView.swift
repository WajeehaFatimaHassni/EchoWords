//
//  ContentView.swift
//  EchoWords
//
//  Created by Wajeeha Fatima Hassni on 16/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            LearnView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Learn")
                }

            StatsView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Stats")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.pink.opacity(0.8), Color.blue.opacity(0.8)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 25) {
                    Text("Hi, ready to learn?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: Color.blue, radius: 5)

                    ProgressCircle(progress: 0.7)
                        .frame(width: 180, height: 180)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            DeckCard(title: "Spanish Basics", imageName: "globe", colors: [Color.red, Color.orange])
                            DeckCard(title: "French Basics", imageName: "book", colors: [Color.purple, Color.blue])
                            DeckCard(title: "Italian Vocabulary", imageName: "flag.italy", colors: [Color.green, Color.teal])
                        }
                        .padding(.horizontal)
                    }

                    Button(action: {
                        // Action for quick review
                    }) {
                        Text("Quick Review")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(15)
                            .shadow(color: Color.purple.opacity(0.8), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal)

                    Button(action: {
                        // Action to explore decks
                    }) {
                        Text("Explore Decks")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(15)
                            .shadow(color: Color.green.opacity(0.8), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal)
                }
                .padding()
                .navigationBarTitle("Dashboard", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("EchoWords")
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: Color.blue, radius: 5)
                    }
                }
            }
        }
    }
}

struct ProgressCircle: View {
    var progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 12)
                .opacity(0.3)
                .foregroundColor(.white)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                .foregroundColor(progress > 0.5 ? .green : .red)
                .rotationEffect(Angle(degrees: 270))
                .shadow(color: (progress > 0.5 ? Color.green : Color.red).opacity(0.6), radius: 8)
                .animation(.easeOut, value: progress)

            Text(String(format: "%.0f%%", min(progress, 1.0) * 100.0))
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .shadow(color: Color.blue, radius: 5)
        }
    }
}

struct DeckCard: View {
    var title: String
    var imageName: String
    var colors: [Color]

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(25)
                .shadow(color: colors.last!.opacity(0.7), radius: 10)

            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 8)
        }
        .frame(width: 160, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20)
        .shadow(color: colors.last!.opacity(0.8), radius: 10)
    }
}

struct LearnView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Text("Start Learning")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: Color.orange, radius: 5)

                Spacer()
            }
            .padding()
        }
    }
}

struct StatsView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Text("Your Stats")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: Color.red, radius: 5)

                Spacer()
            }
            .padding()
        }
    }
}

struct ProfileView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Text("Your Profile")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: Color.pink, radius: 5)

                Spacer()
            }
            .padding()
        }
    }
}
