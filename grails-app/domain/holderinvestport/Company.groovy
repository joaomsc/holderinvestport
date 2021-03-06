package holderinvestport

class Company {

    String tradingName
    String name
    String description
    String image
    Date dateCreated
    Date lastUpdated

    static constraints = {
        tradingName nullable: false, blank: false
        name nullable: false, blank: false
        description nullable: true, blank: true
        image nullable: true
    }

    static hasMany = [portifolios: Portifolio]
    static belongsTo = [portifolios: Portifolio]

    static mapping = {
        autoTimestamp true
        version false
        description type: "text"
        portifolios joinTable: [name: 'portifolio_company', coloumn: 'portifolio_id']
    }

    boolean isInPortifolio(Long userId) {

        def currentUser = User.get(userId)
        def companiesInPortifolio = currentUser.getPortifolios().first().getCompanies()
        def companyId = this.getId()

        if (companiesInPortifolio.asBoolean()) {
            return companiesInPortifolio.asList().any { it -> it.getId() == companyId }
        }

        return false

    }

    String toString() {
        tradingName
    }
}
