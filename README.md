# SwiftUI-Pokedex

## Presentation

A simple, playground project where I will try to build a Pokédex app. The user will land on a list view loading a list of Pokémon. He will then be able to navigate to a specific Pokémon view (using a sheet transition), or to a settings view (with a default navigation transition).
Some key concepts that I will try to implement:

- The UI framework in use will be [SwiftUI](https://developer.apple.com/xcode/swiftui/). 
- I will try to make it a cross-platform one, handling at least iOS and macOS.
- The latest iOS and macOS versions (respectively 17.0 and 14.0) will be used, enabling their brand new features (NavigationStack/Path, @Observable, etc...).
- Four different app targets will be created in order to try several architectures and see how they blend with SwiftUI : MV (the basic use of SwiftUI), MVVM, Clean Architecture and TCA (The Composable Architecture).
- No matter which architecture will be chosen, the SOLID, KISS and DRY programming concepts will be followed. Especially, the model and the API will be isolated and independent from the rest of the architecture.
- Tests will be created to check the validity of the model, API calls or JSON-to-model mapping.

## Dependencies

Swift Package Manager will be used to handle dependencies. Local libraries/packages may also be used, i.e. for the app model.

### Local dependencies

The app embeds some local packages, reusable througout the different targets:

- *Model*: containing static structs and enums, representing the app elements to display.
- *Provider*: defines the app APIs, each endpoint returning some Data.
- *Mapper*: a package which allows transforming the Data coming from Provider to the app Model representations.
- *API*: a package unifying the previous three packages, easing the data fetching as follows: *let list = try await API.getPokemonList()*.  

### Remote dependencies

- `Moya`: all the API requests will be simplified with Moya, which itself also embeds `Alamofire`.
- `Kingfisher`: will be used for image downloading & cache.

## API

- The main list content will be available from my website, at https://www.robbeyroad.com/api/pokemons.json. It contains the 493 first Pokémons, and their names localized in several languages, which is not possible with pokeapi.co API with a simple call. In the same vein, the evolution item list will be available at https://www.robbeyroad.com/api/items.json.
- However, https://pokeapi.co will be used for every Pokémon specific query, which includes: basic Pokémon data, species data and evolution data. 

## Tests

The app is currently embedding the following tests, by packages:

- *Model*: since this package embeds static and basic data, not a lot is to be tested here. However, some tests still exist to ensure that only Pokémons from the 4 first generations (ids spanning from 1 to 493) can be implemented.
- *Provider*: these tests check that all the endpoints are reachable and return actual Data objects.
- *Mapper*: a lot of tests have been added in this package, in order to try all the possible cases - especially the evolution chains, where a lot of different cases may occur.
- *API*: just like this package aims at unifying the previous local packages, its embedded tests check that the APIs work well. 
