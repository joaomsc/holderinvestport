package holderinvestport

enum PortifolioType {
    DEFAULT("PADRÃO")

    private final String value

    PortifolioType(String value){
        this.value = value;
    }

    String toString() {
        value
    }

    String getKey() {
        name()
    }

    static list(){
        [DEFAULT]
    }
}