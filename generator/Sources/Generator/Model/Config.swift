import Foundation

protocol Config: Decodable {
    
    init(from url: URL) throws
    init(from string: String) throws
    
}

extension Config {
    
    init(from url: URL) throws {
        try self.init(data: Data(contentsOf: url))
    }
    
    init(from string: String) throws {
        try self.init(data: Data(string.utf8))
    }
    
    private init(data: Data) throws {
        self = try JSONDecoder().decode(Self.self, from: data)
    }
    
}
