class ContactInfo {
    var name: String
    var phoneNumber: String
    
    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
    func printContactInfo() {
        print("이름 : \(name)\n전화번호 : \(phoneNumber)")
    }
}
