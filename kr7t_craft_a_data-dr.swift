import Foundation

// Data Model for Security Tool Analyzer
struct SecurityTool {
    let name: String
    let description: String
    let riskLevel: Int
    let vulnerabilityCount: Int
}

// Data Model for Vulnerability
struct Vulnerability {
    let id: Int
    let name: String
    let severity: String
    let description: String
}

// Data Source for Security Tool Analyzer
class SecurityToolAnalyzer {
    private var securityTools: [SecurityTool] = [
        SecurityTool(name: "Tool1", description: "Description 1", riskLevel: 3, vulnerabilityCount: 5),
        SecurityTool(name: "Tool2", description: "Description 2", riskLevel: 2, vulnerabilityCount: 3),
        SecurityTool(name: "Tool3", description: "Description 3", riskLevel: 1, vulnerabilityCount: 2)
    ]
    
    private var vulnerabilities: [Vulnerability] = [
        Vulnerability(id: 1, name: "Vuln 1", severity: "High", description: "Description 1"),
        Vulnerability(id: 2, name: "Vuln 2", severity: "Medium", description: "Description 2"),
        Vulnerability(id: 3, name: "Vuln 3", severity: "Low", description: "Description 3")
    ]
    
    func analyzeSecurityTool(_ toolName: String) -> [Vulnerability]? {
        guard let tool = securityTools.first(where: { $0.name == toolName }) else {
            return nil
        }
        
        var vulnerabilitiesForTool: [Vulnerability] = []
        
        // Simulate data-driven analysis
        for _ in 1...tool.vulnerabilityCount {
            vulnerabilitiesForTool.append(vulnerabilities.randomElement()!)
        }
        
        return vulnerabilitiesForTool
    }
}

// Main Function
func main() {
    let analyzer = SecurityToolAnalyzer()
    if let vulnerabilities = analyzer.analyzeSecurityTool("Tool1") {
        print("Vulnerabilities for Tool1:")
        for vulnerability in vulnerabilities {
            print("  - \(vulnerability.name) (\(vulnerability.severity))")
        }
    } else {
        print("Tool not found.")
    }
}

main()