import Foundation

// Define a structure to represent a Claim
struct Claim {
    var id: Int
    var patientName: String
    var amount: Double
    var status: String // "Pending", "Approved", "Denied"
}

// Function to create sample claims with madeup names and amounts
func createSampleClaims() -> [Claim] {
    return [
        Claim(id: 1, patientName: "John Doe", amount: 150.0, status: "Pending"),
        Claim(id: 2, patientName: "Jane Smith", amount: 200.0, status: "Approved"),
        Claim(id: 3, patientName: "Alice Johnson", amount: 100.0, status: "Denied"),
        Claim(id: 4, patientName: "Bob Brown", amount: 250.0, status: "Pending"),
    ]
}

// Function to review claims of the id's of patient names
func reviewClaims(claims: inout [Claim]) {
    for index in claims.indices {
        var claim = claims[index]
        if claim.status == "Pending" {
            print("Reviewing Claim ID: \(claim.id) for patient \(claim.patientName)")
            // Simulate review process
            if claim.amount < 200 {
                claim.status = "Approved"
                print("Claim ID: \(claim.id) Approved")
            } else {
                claim.status = "Denied"
                print("Claim ID: \(claim.id) Denied")
            }
            claims[index] = claim // This will update the claim status
        } else {
            print("Claim ID: \(claim.id) already \(claim.status)")
        }
    }
}

// Function to generate a report of denied claims will automatically print
func generateErrorReport(claims: [Claim]) {
    print("\nDenied Claims Report:")
    let deniedClaims = claims.filter { $0.status == "Denied" }
    for claim in deniedClaims {
        print("Claim ID: \(claim.id), Patient: \(claim.patientName), Amount: $\(claim.amount)")
    }
}

// Function to calculate total approved claims amount
func calculateTotalApproved(claims: [Claim]) -> Double {
    let totalApproved = claims.filter { $0.status == "Approved" }.reduce(0) { $0 + $1.amount }
    return totalApproved
}

// Main function to run the program
func main() {
    var claims = createSampleClaims()
    print("Claims Review Process\n")
    reviewClaims(claims: &claims)
    
    // Generate error report for denied claims
    generateErrorReport(claims: claims)
    
    // Calculate total approved claims amount
    let totalApproved = calculateTotalApproved(claims: claims)
    print("\nTotal Approved Claims Amount: $\(totalApproved)")
}

// Execute the main function
main()
