import SwiftUI

class TimeManager: ObservableObject {
    private var displayLink: CADisplayLink?
    private var previousTimestamp: CFTimeInterval = 0
    @Published var isTimerRunning = false
    @Published var timeElapsed: TimeInterval = 0
    
    func start() {
        isTimerRunning = true
        previousTimestamp = CACurrentMediaTime()
        displayLink = CADisplayLink(target: self, selector: #selector(updateTimer))
        displayLink?.add(to: .current, forMode: .common)
    }
    
    func stop() {
        isTimerRunning = false
        displayLink?.invalidate()
        displayLink = nil
    }
    
    func reset() {
        stop()
        timeElapsed = 0
    }
    
    @objc private func updateTimer(_ displayLink: CADisplayLink) {
        let currentTimestamp = displayLink.timestamp
        let elapsedTime = currentTimestamp - previousTimestamp
        previousTimestamp = currentTimestamp
        timeElapsed += elapsedTime
    }
}
