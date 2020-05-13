package gsesuite;

public class PeaksperGeneResult {

    String geneid;
    Double length;
    Double log10len;
    Integer numpeaks;
    int peak;

    public PeaksperGeneResult(String geneid, Double length, Double log10len, Integer numpeaks, int peak) {
        this.geneid = geneid;
        this.length = length;
        this.log10len = log10len;
        this.numpeaks = numpeaks;
        this.peak = peak;
    }

    public String getGeneid() {
        return geneid;
    }

    public void setGeneid(String geneid) {
        this.geneid = geneid;
    }

    public Double getLength() {
        return length;
    }

    public void setLength(Double length) {
        this.length = length;
    }

    public Double getLog10len() {
        return log10len;
    }

    public void setLog10len(Double log10len) {
        this.log10len = log10len;
    }

    public Integer getNumpeaks() {
        return numpeaks;
    }

    public void setNumpeaks(Integer numpeaks) {
        this.numpeaks = numpeaks;
    }

    public int getPeak() {
        return peak;
    }

    public void setPeak(int peak) {
        this.peak = peak;
    }
}
