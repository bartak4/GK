import Foundation
import GKCore
import PromiseKit

/// Specify navigation functions from this controller to others
/// Connection data controller -> coordinator
/// # Example #
/// ```
/// func displayLicense(initialData: LicenseInitialData)
/// ```
/// Warning: Don't forget to add **TransactionCoordinatorDelegate** as an extension to a designated coordinator
protocol TransactionCoordinatorDelegate: CoordinatorDelegate {
    
}

/// Connection view -> data controller
protocol TransactionViewDataControllerDelegate: DataControllerType {
    
}

/// Connection view model -> data controller
protocol TransactionViewModelDataControllerDelegate: ViewModelType {
    
}

/// Connection model -> data controller
protocol TransactionModelDataControllerDelegate: AnyObject {
    
}

final class TransactionDataController {
    
    private let model: TransactionDataModelControllerDelegate
    private weak var coordinator: TransactionCoordinatorDelegate?
    private weak var view: TransactionViewType?
    
    init(coordinator: TransactionCoordinatorDelegate, view: TransactionViewType, model: TransactionDataModelControllerDelegate) {
        self.coordinator = coordinator
        self.view = view
        self.model = model
    }
    
    func viewDidLoad() {
        presentViewModel()
        model.test()
    }
    
    private func presentViewModel() {
        DispatchQueue.main.async { [self] in
            let viewModel = TransactionViewModel(delegate: self)
            view?.display(viewModel)
        }
    }
}

extension TransactionDataController: TransactionViewDataControllerDelegate {
    
}

extension TransactionDataController: TransactionViewModelDataControllerDelegate {
    
}

extension TransactionDataController: TransactionModelDataControllerDelegate {
    
}
