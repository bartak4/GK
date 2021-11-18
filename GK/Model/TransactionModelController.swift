import Foundation
import GKCore

/// Connection data controller -> model controller
protocol TransactionDataModelControllerDelegate: AnyObject {
    var initialData: TransactionInitialData { get }
    func test()
}

struct JSONdata: Codable {
    let transaction: TransactionList
}

struct TransactionList: Codable {
    let transactionID: Int
}

final class TransactionModelController: BaseModelController<TransactionInitialData> {
    


    weak var delegate: TransactionModelDataControllerDelegate?

    required init(initialData: TransactionInitialData) {
        super.init(initialData: initialData)
        
        
    }
    
    func loadJson(fileName: String) -> JSONdata? {
       let decoder = JSONDecoder()
       guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let decodedData = try? decoder.decode(JSONdata.self, from: data)
                
       else {
            return nil
       }

       return decodedData
    }
}

extension TransactionModelController: TransactionDataModelControllerDelegate {
    func test() {
        print("sdsdf")
    }
    
    
    
}
/*
   1. Vytahnout json z resources
   2. Vytvorit si modely pro json strukturu
   3. Vratit strukturu do DataControlleru s zpozdenim 2s
 */
