package holderinvestport

class Portifolio {

    PortifolioType type = PortifolioType.DEFAULT
    Date dateCreated
    Date lastUpdated

    static hasMany = [companies: Company]
    static belongsTo = [owner:User]

    static mapping = {
        autoTimestamp true
        version false
        companies joinTable: [name: 'portifolio_company', coloumn: 'company_id']
    }

    static constraints = {
        type nullable: false
        owner nullable: false
        companies nullable: true
    }

    String toString() {
        this.owner.getFullname() + "'s portifolio" + "(" + this.type.toString()  + ")"
    }

}
