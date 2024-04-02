struct Medication: Codable, Equatable {
    var name: String
    var dosage: String

    static func ==(lhs: Medication, rhs: Medication) -> Bool {
        return lhs.name == rhs.name && lhs.dosage == rhs.dosage
    }
}
