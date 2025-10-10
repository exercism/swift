import Testing
import Foundation
import TOMLKit
@testable import Generator

@Test
func `Testing TOML file not found`() {
    let error = #expect(throws: CocoaError.self) {
        _ = try TOMLFile(fileURL: URL(filePath: "file.toml"))
    }
    #expect(error?.code == .fileReadNoSuchFile)
}

@Test
func `Testing TOML file is empty`() {
    #expect(throws: Never.self) {
        let file = try TOMLFile(string: "")
        #expect(file.uuids.isEmpty)
    }
}

@Test
func `Testing Malformed toml files are prohibited`() {
    #expect(throws: TOMLParseError.self) {
        let file = try TOMLFile(string: """
        []
        """)
        #expect(file.uuids.isEmpty)
    }
}

@Test
func `Testing a single uuid to be included`() {
    let expectedUUIDs = Set(["abc"])
    #expect(throws: Never.self) {
        let file = try TOMLFile(string: "[abc]")
        #expect(file.uuids == expectedUUIDs)
    }
}

@Test
func `Testing all tests to be included`() {
    let expectedUUIDs = Set([
        "1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce",
        "b4c6dbb8-b4fb-42c2-bafd-10785abe7709"
    ])
    
    #expect(throws: Never.self) {
        let file = try TOMLFile(string: """
        [1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce]
        description = "no name given"

        [b4c6dbb8-b4fb-42c2-bafd-10785abe7709]
        description = "a name given"
        """)
        #expect(file.uuids == expectedUUIDs)
    }
}

@Test
func `Testing no tests to be included`() {
    #expect(throws: Never.self) {
        let file = try TOMLFile(string: """
        [1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce]
        description = "no name given"
        include = false
        """)
        #expect(file.uuids.isEmpty)
    }
}


@Test
func `Testing some tests to be included`() {
    let expectedUUIDs = Set([
        "1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce"
    ])
    
    #expect(throws: Never.self) {
        let file = try TOMLFile(string: """
        [3549048d-1a6e-4653-9a79-b0bda163e8d5]
        description = "no name given"
        include = false
        
        [1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce]
        description = "a name given"
        """)
        #expect(file.uuids == expectedUUIDs)
    }
}
