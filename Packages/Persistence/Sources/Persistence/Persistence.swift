import Model
import SwiftData
import SwiftUI

public extension View {
    func addPersistentStores() -> some View {
        return self
            .modelContainer(for: PersistenceContent.self)
    }
}
