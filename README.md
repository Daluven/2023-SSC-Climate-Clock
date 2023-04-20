# Climate-Clock
Basic stopwatch, with gauges indicating: 
- Trees lost
- Carbon dioxide released
- Waste generated 
- Freshwater used 
in the time indicated by the stopwatch.

Submission for the 2023 Swift Student Challenge organised by Apple

I have recently been involved in several sustainability and green living events and projects, and wondered about the true impact of our unsustainable lifestyles on the environment. Thus, I decided to make an app with real data for figures such as number of trees lost and carbon emissions to visualise the rate and extent at which we are ruining our planet. The figures were beyond my expectations and I had to use scientific prefixes to portray them without completely overloading the gauges.

CADisplayLink was used in conjunction with CFTimeInterval as well as with @objc to obtain precise updates to the timer. Timer Data was then passed between views using an ObservableObject, @Published variables, and functions.

The interface is built entirely with SwiftUI. In order to obtain and display the correct values for the different figures and labels, .truncatingRemainer() and .rounded() were used extensively. Gauges were used to visually represent the figures in an engaging way. Their appearances were modified using .tint() and Gradient(colors: []).
