import Foundation
import TOMLKit

struct TOMLConfig: Config {
    
    let uuids: Set<String>
    
    init(from url: URL) throws {
        try self.init(from: String(contentsOf: url, encoding: .utf8))
    }
    
    init(from string: String) throws {
        let table = try TOMLTable(string: string)
        var uuids = Set<String>()
        for (key, value) in table {
            guard
                let properties = value.table,
                properties.contains(key: "include")
            else {
                uuids.insert(key)
                continue
            }
            
            if properties["include"] as? Bool == true {
                uuids.insert(key)
            }
        }
        self.uuids = uuids
    }
    
}
