package teachmealex;

public class Verbo {
    private String verb, present, past, pastParticipe;

    public Verbo(String verb, String present, String past, String pastParticipe) {
        this.verb = verb;
        this.present = present;
        this.past = past;
        this.pastParticipe = pastParticipe;
    }

    public Verbo() {
    }

    public String getPastParticipe() {
        return pastParticipe;
    }

    public void setPastParticipe(String pastParticipe) {
        this.pastParticipe = pastParticipe;
    }

    public String getVerb() {
        return verb;
    }

    public void setVerb(String verb) {
        this.verb = verb;
    }

    public String getPresent() {
        return present;
    }

    public void setPresent(String present) {
        this.present = present;
    }

    public String getPast() {
        return past;
    }

    public void setPast(String past) {
        this.past = past;
    }
}
