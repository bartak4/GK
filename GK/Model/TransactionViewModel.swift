import Foundation
import GKCore

/// ViewModel is read-only class, take it as a structure, just a current data snapshot for the view to display it, view state is heald in 'TransactionDataController' that fills that view model
final class TransactionViewModel: BaseViewModel {
        
    private weak var delegate: TransactionViewModelDataControllerDelegate?
    
    required init(delegate: TransactionViewModelDataControllerDelegate) {
        self.delegate = delegate
    }
}
