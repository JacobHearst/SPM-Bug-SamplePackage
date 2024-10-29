//
// DumpProducts.swift
//

import Foundation
import PackagePlugin

@main
struct DumpProducts: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        print(context.package.products.map(\.name))
    }
}
