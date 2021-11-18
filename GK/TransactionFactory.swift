import Foundation
import UIKit

extension TransactionViewController {
    
    /// Acessible only from a coordinator!
    /// - Parameters:
    ///   - initialData: Data needed to reference from another view controller
    ///   - coordinator: Current coordinator reference, don't forget to add **TransactionCoordinatorDelegate** as an extension to a designated coordinator
    /// - Warning: Requires a storyboard with name 'Transaction.storyboard' containing a single view controller with storyboard ID 'TransactionViewController'
    /// - Returns: Initialized view controller from storyboard
    static func instantiate(initialData: TransactionInitialData, coordinator: TransactionCoordinatorDelegate) -> TransactionViewType {
        guard let viewController = UIStoryboard(name: storyboardId, bundle: Bundle.main).instantiateViewController(withIdentifier: viewControllerId) as? TransactionViewController else {
            fatalError("View controller '\(self)' with specified storyboard name '\(storyboardId)' and view controller identifier '\(viewControllerId)' doesn't exist!")
        }
        let modelController = TransactionModelController(initialData: initialData)
        let dataController = TransactionDataController(coordinator: coordinator, view: viewController, model: modelController)
        viewController.dataController = dataController
        modelController.delegate = dataController
        return viewController
    }
}
