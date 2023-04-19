import SwiftUI

struct TimerView: View {
    @ObservedObject var timeManager: TimeManager

    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(timeStopWatch())")
                    .font(.system(size:50, design: .monospaced))
                    .padding(.top, 40)
                    .fixedSize(horizontal: true, vertical: false)
                
                HStack {
                    Button(action: {
                        timeManager.reset()
                    }) {
                        Text("Reset")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            
                    Button(action: {
                        if timeManager.isTimerRunning {
                            timeManager.stop()
                            
                        } else {
                            timeManager.start()
                            
                        }
                    }) {
                        Text(timeManager.isTimerRunning ? "Stop" : "Start")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .background(timeManager.isTimerRunning ? Color.red : Color.green)
                            .cornerRadius(10)
                    }
                    .padding(.leading)
                }
                .padding(.bottom,20)
                
                Gauge(value: timeDivided(dividing: 2.10384), in: 0...1) {
                    HStack { 
                        Image(systemName: "tree")
                        Text("Trees Lost")
                    }
                } currentValueLabel: {
                    if (timeManager.timeElapsed / 0.00210384).rounded(.towardZero) > 10000 {
                        HStack {
                            Image(systemName: "flame.fill")
                            Text("\((timeManager.timeElapsed / 0.00210384).rounded(.towardZero), specifier: "%.0f")")
                            Image(systemName: "flame.fill")
                        }
                    } else {
                        Text("\((timeManager.timeElapsed / 0.00210384).rounded(.towardZero), specifier: "%.0f")")
                    }

                } minimumValueLabel: {
                    Text("\((timeManager.timeElapsed / 2.10384).rounded(.towardZero), specifier: "%.0f") K")
                } maximumValueLabel: {
                    Text("\(((timeManager.timeElapsed / 2.10384).rounded(.towardZero) + 1), specifier: "%.0f") K")
                }
                .tint(Gradient(colors: [.green, .green, .brown, .brown, .orange, .red, .red]))
                .padding()
                
                Gauge(value: timeDivided(dividing: 7.746097), in: 0...1) {
                    HStack { 
                        Image(systemName: "smoke.fill")
                        Text("CO\u{00B2}") +  Text(" released")
                    }
                } currentValueLabel: {
                    Text("\((timeManager.timeElapsed / 0.0007746097).rounded(.towardZero), specifier: "%.0f") tonnes")
                } minimumValueLabel: {
                    Text("\(((timeManager.timeElapsed / 7.7746097).rounded(.towardZero)*10), specifier: "%.0f") Kt")
                } maximumValueLabel: {
                    Text("\((((timeManager.timeElapsed / 7.746097).rounded(.towardZero) + 1)*10), specifier: "%.0f") Kt")
                }
                .tint(Gradient(colors: [Color(red: 140/255, green: 100/255, blue: 90/255), Color(red: 120/255, green: 120/255, blue: 120/255)]))
                .padding()
                
                Gauge(value: timeDivided(dividing: 15.64581061), in: 0...1) {
                    HStack { 
                        Image(systemName: "trash")
                        Text("Waste Generated")
                    } 
                } currentValueLabel: {
                    Text("\((timeManager.timeElapsed / 0.01564581061).rounded(.towardZero), specifier: "%.0f") tonnes")
                } minimumValueLabel: {
                    Text("\((timeManager.timeElapsed / 15.64581061).rounded(.towardZero), specifier: "%.0f") Kt")
                } maximumValueLabel: {
                    Text("\(((timeManager.timeElapsed / 15.64581061).rounded(.towardZero) + 1), specifier: "%.0f") Kt")
                }
                .tint(Gradient(colors: [Color(red: 140/255, green:100/255, blue: 40/255), Color( red: 150/255, green: 150/255, blue: 60/255)]))
                .padding()
                
                Gauge(value: timeDivided(dividing: 7.96285735914), in: 0...1) {
                    HStack { 
                        Image(systemName: "drop")
                        Text("Freshwater Used")
                    } 
                } currentValueLabel: {
                    Text("\((timeManager.timeElapsed / 0.00000796285735914).rounded(.towardZero), specifier: "%.0f") cubic metres")
                } minimumValueLabel: {
                    Text("\((timeManager.timeElapsed / 7.96285735914).rounded(.towardZero), specifier: "%.0f") Mm\u{00B3}")
                } maximumValueLabel: {
                    Text("\(((timeManager.timeElapsed / 7.96285735914).rounded(.towardZero) + 1), specifier: "%.0f") Mm\u{00B3}")
                }
                .tint(Gradient(colors: [.blue]))
                .padding()
                
                Spacer()
            }
        }
    }
    
    func timeStopWatch() -> String {
        let minutes = Int(timeManager.timeElapsed / 60)
        let seconds = Int(timeManager.timeElapsed.truncatingRemainder(dividingBy: 60))
        let centiseconds = Int((timeManager.timeElapsed.truncatingRemainder(dividingBy: 1) * 100))
        return String(format: "%02d:%02d:%02d", minutes, seconds, centiseconds)
    }
    func timeDivided(dividing: Double) -> Double {
        let centisus = (timeManager.timeElapsed / dividing).truncatingRemainder(dividingBy: 1)
        return centisus
    }
    func timeGauge(dividing: Double) -> String {
        let timeGauged = (timeManager.timeElapsed / dividing).rounded(.towardZero)
        return String(format: "%.0f", timeGauged)
    }
}

