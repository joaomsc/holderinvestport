package holderinvestport

class Company {

    String tradingName
    String name
    String description

    static constraints = {
        tradingName nullable: false, blank: false
        name nullable: false, blank: false
        description nullable: true, blank: true
    }

    String toString() {
        tradingName
    }
}
