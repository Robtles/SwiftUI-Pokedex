# SwiftUI-Pokedex

## Presentation

A simple, playground project where I will try to build a Pokédex app. The user will land on a list view loading a list of Pokémon. He will then be able to navigate to a specific Pokémon view (using a sheet transition), or to a settings view (with a default navigation transition).
Some key concepts that I will try to implement:

- The UI framework in use will be [SwiftUI](https://developer.apple.com/xcode/swiftui/). 
- I will try to make it a cross-platform one, handling at least iOS and macOS.
- The latest iOS and macOS versions (respectively 17.0 and 14.0) will be used, enabling their brand new features (NavigationStack/Path, @Observable, etc...).
- Four different app targets will be created in order to try several architectures and see how they blend with SwiftUI : MV (the basic use of SwiftUI), MVVM, Clean Architecture and TCA (The Composable Architecture).
- No matter which architecture will be chosen, the SOLID, KISS and DRY programming concepts will be followed. Especially, the model and the API will be isolated and independent from the architecture. 
- Tests will be created to check the validity of the model, API calls or JSON-to-model mapping.

## Dependencies

Swift Package Manager will be used to handle dependencies. Local libraries/packages may also be used, i.e. for the app model.

- `Moya`: all the API requests will be simplified with Moya, which itself also embeds `Alamofire`.
- `Kingfisher`: will be used for image downloading & cache.
