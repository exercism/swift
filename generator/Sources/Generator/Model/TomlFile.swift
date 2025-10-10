import Foundation
import TOMLKit

struct TOMLFile {
    
    let uuids: Set<String>
    
    init(fileURL: URL) throws {
        try self.init(string: String(contentsOf: fileURL, encoding: .utf8))
    }
    
    init(string: String) throws {
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
