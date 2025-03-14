### Summary: Include screen shots or a video of your app highlighting its features
I am proud to present to you Sogay Bonoes! I wanted to call the app Soggy Bottoms in honor of Great British Baking, but the photoshop AI Image Generator was unable to spell correctly that day, so we went with what it created. 

Visually, it's pleasing if rather a plain list of recipes, but under the hood it has some goodies. Notably, there is a Metal Mode that completely reskins the app through the themeing system I describe below.

#### Screenshots

![App Screenshot](https://i.imgur.com/VRyeu4c.png)
![App Screenshot](https://i.imgur.com/vFV8HWg.png)

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
You told me I should demonstrate my strengths, so I focused on the following areas:
#### SDK Driven Design
The only thing in the app itself is the App file. I really like the practice of creating your own SDK to build an app, and in that spirit there is not a single view or helper that doesn't live in the SDK.

This also forces some good design concepts in the long run, especially with dependency injection. Ideally each layer of the SDK would be its own repo with its own tests, but this demonstrates a solid foundation for such things.

#### UI Components
I don't like messy views. They're difficult to maintain just like bloated classes. I made sure to break up my view components into bite sized tidbits of data. For example, A RecipeList is made of iterating on RecipeRows. Over time, we may find new technology that better suits our listing/scrolling needs, like how we all went from tableviews to better things over time? I think focused view components make an app easy to understand for junior devs, and easy to maintain and upgrade in the long run.
#### Themeing
In my UI components, you'll notice most of the style data is coming from a Theme object out of an EnvironmentObject like this:

    public struct RecipeTitle: View {
        @EnvironmentObject var container: DIContainer
        let text: String
        
        public init(text: String) {
            self.text = text
        }
        
        public var body: some View {
            Text(text)
                .font(.custom(container.Theme.Typography.Title.typeFace,
                        size: container.Theme.Typography.Title.size))
        }
    }
This has a number of advantages! Since the Theme is published, you can swap it on the fly. I used this in my "Metal Mode" feature to update not just the background image, but Fonts as well as Brand and Semantic color schemes. While this is a fun example, it also allows easy support for color blindness accessibility by creating themes for Deuteranomaly and other types of color blindness, or upsizing fonts for the visually impaired.

#### State Management
I included a Loadable framework here for State Management. Not only does it help coordinate views so it's clear which view is loading under which condition:

    // From the ViewModel
    @Published var recipes: Loadable<[Recipe]>

    //...to the View
    private var content: AnyView {
        switch viewModel.recipes {
        case .notRequested: return AnyView(notRequestedView)
        case .isLoading: return AnyView(loadingView())
        case let .loaded(recipes): return AnyView(loadedView(recipes))
        case let .failed(error): return AnyView(failedView(error))
        }
    }

It also maintains previous loads under the hood, so if you refresh and get an error, it will maintain the state of the last successful api call so you don't end up with an empty screen.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I think I spent about two days in total. A few after-hours partial days working on specific areas of the project like networking or unit testing, and then one full day to go thorugh everything and clean it up and ensure I met each requirement. I'm in the middle of a MAJOR release at my current role, and as noted I had to take care of a family matter and fly down to California, so this was as much time as I had. (But I'm proud of what I did in a short period of time)

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
I optimized the view for iPad, since I had a physical test device on hand that didn't belong to a corporation to verify what was on the simulator. Given my theme approach, it would not be hard to optimize for the iPhone as well, but I thought putting time into showing off the Metal Theme was more fun than adjusting font sizes and padding for the iPhone. I'm happy to work on the phone side as well, but needed to manage my time appropriately.

### Weakest Part of the Project: What do you think is the weakest part of your project?
Where to begin!
#### Configuration
I love a good configuration system, and this app has none. Normally I work on a robust workflow checking for a remote config, then falling back to the most recent config if that fails, and finally loading a default config that ships with the app if neither of those succeed.

I use configuration for everything! URLSession options, storage limits, Theme data like colors and fonts! I'm obsessive about Dependency Injection and without a good configuration I feel naked.

#### Dependency Injection
While I did use this as much as was practical in the timeframe, I would normally take SO much time to set up dependencies like Configuration, Persistence, Networking, Themeing, and everything else at the start of the app. For example, I just realized I instantiated the repository that powers the ViewModel in the view as a temporary measure while I scaffolded the app and didn't fix it. Yuck. (I'm leaving it in on purpose as I told myself no more tinkering. I could work on this for days.)

#### Networking
I like my solution to combine async/await into a publishable variable that reactively binds to the view, but I don't LOVE it. I saw some fun things now with SwiftData where you can more directly bind state based data to views, but it would have taken too long to implement without having done it before.

#### Cache Management
Ideally I'd implement a Least Recently Used queue to manage storage size, but to do those things correctly would have taken more time than I had. I'm also aware that using a key/value cache means I'm loading a lot of image data into memory that may not be used, so overall cache robustness is lacking.

#### Testing
It represents a solid effort given the time, but I'd like to do much more.

#### Fun
I didn't add unnecessary features due to time constraints, but given more time I would have loved to have added a YouTube modal of some kind for each recipe.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

#### Reviewer Courtesy
The API Endpoint is located at:
SDK/Networking/RecipesRepository.swift on line 44

#### Requirements Explanation

I took the requirements very seriously. I made sure to confirm each of the following:

#### Async/Await
I wrote everything by hand to ensure there is no cheating under the hood.

#### External dependencies
I didn't add any swift packages or use SwiftLint to be as true to the concept as possible.

#### Efficient Network Usage
I spent a lot of time debugging to ensure views and images were NOT loading off screen (more than a handful ahead as that's necessary to enable scrolling). I emptied my cache on each load and watched images being loaded or not loaded as I scrolled to verify the LazyVStack and .onAppear were functioning correctly. I also confirmed that when I didn't clear the cache, if I loaded the app and scrolled each recipe once, that on subsequent reloads no images were loaded from the network.

I used pull to refresh through refreshable to allow for that capability, and tested with a counter that changed the endpoint from invalid to valid to ensure it works correctly.

#### Endpoints
I made sure to test results with the three endpoints provided, as well as malformed URLs to ensure the correct response view was loaded, and failures were graceful.
