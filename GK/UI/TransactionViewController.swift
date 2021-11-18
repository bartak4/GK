import UIKit
import GKCore

/// View is stateless, only updates from data controller through 'TransactionViewType' protocol
/// Connection view -> data controller
/// # Example #
/// ```
/// func display(_ viewModel: TransactionViewModel)
/// func displayProfileImage(_ image: UIImage)
/// ```
protocol TransactionViewType: ViewType {
    func display(_ viewModel: TransactionViewModel)
}

final class TransactionViewController: BaseViewController {
    
    public var dataController: TransactionViewDataControllerDelegate!
    private var viewModel: TransactionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataController.viewDidLoad()
    }
    
    override func setupViews() {
        super.setupViews()
    }

    override func styleViews() {
        super.styleViews()
    }
    
    override func setupLocalizations() {
        super.setupLocalizations()
    }
}

extension TransactionViewController: TransactionViewType {
    
    /// Called when View and ViewModel are prepared
    /// - Parameter viewModel: View data for the current view
    /// # Example #
    /// ```
    /// nameLabel.text = viewModel.name
    /// ```
    func display(_ viewModel: TransactionViewModel) {
        self.viewModel = viewModel
    }
}
