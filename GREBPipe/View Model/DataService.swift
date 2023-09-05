import Foundation

public class DataService {
	let root_dir = "/Users/guillermomolina/Documents/WORK_alchemy/prod/pequod/source/INDELEBLE/assets"
	
	
	public func listEntitiesInCategories() -> [String: [String]] {
		var entities_data = [String: [String]]()
		let fileManager = FileManager.default
		guard let rootDirectory = URL(string: root_dir) else {
			print("Error: Invalid root directory URL")
			return entities_data
		}
		
		do {
			let categoryURLs = try fileManager.contentsOfDirectory(at: rootDirectory, includingPropertiesForKeys: nil)
			for categoryURL in categoryURLs {
				var isDirectory: ObjCBool = false
				if fileManager.fileExists(atPath: categoryURL.path, isDirectory: &isDirectory), isDirectory.boolValue {
					let entityNames = try fileManager.contentsOfDirectory(at: categoryURL, includingPropertiesForKeys: nil).map { $0.lastPathComponent }
					let filteredEntityNames = entityNames.filter { !$0.hasPrefix(".") }
					entities_data[categoryURL.lastPathComponent] = filteredEntityNames
					
				}
				
			}
			return entities_data
		} catch {
			print("Error while enumerating files \(rootDirectory.path): \(error.localizedDescription)")
		}
		
		return entities_data
	}
	
	public func listCategories() {
		let fileManager = FileManager.default
		guard let rootDirectory = URL(string: root_dir) else {
			print("Error: Invalid root directory URL")
			return
		}
		
		do {
			let fileURLs = try fileManager.contentsOfDirectory(at: rootDirectory, includingPropertiesForKeys: nil)
			// process files
		} catch {
			print("Error while enumerating files \(rootDirectory.path): \(error.localizedDescription)")
		}
	}
	
	public func loadEntitiesFromStorage() -> [String: [String]] {
		
		let entitiesInCategories = listEntitiesInCategories()
		guard !entitiesInCategories.isEmpty else {
			print("Error: No entities in categories")
			return [:]
		}
		return entitiesInCategories
			
	}
}

