package gsesuite;

/**
 * Created by snehalpatil on 1/24/19.
 */
public class peResultsFnames {


    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getPeakgenes() {
        return peakgenes;
    }

    public void setPeakgenes(String peakgenes) {
        this.peakgenes = peakgenes;
    }

    public String getFdr() {
        return fdr;
    }

    public void setFdr(String fdr) {
        this.fdr = fdr;
    }

    public String getPval() {
        return pval;
    }

    public void setPval(String pval) {
        this.pval = pval;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCelline() {
        return cellline;
    }

    public void setCelline(String celline) {
        this.cellline = celline;
    }



    String peakgenes;

    public peResultsFnames(String peakgenes, String fdr, String pval, String status, String cellline, String fname, String locusdef, String treatment) {
        this.peakgenes = peakgenes;
        this.fdr = fdr;
        this.pval = pval;
        this.status = status;
        this.cellline = cellline;
        this.fname = fname;
        this.locusdef = locusdef;
        this.treatment = treatment;
    }

    String fdr;
    String pval;
    String status;
    String cellline;
    String fname;
    String locusdef;
    String treatment;



    public String getLocusdef() {
        return locusdef;
    }

    public void setLocusdef(String locusdef) {
        this.locusdef = locusdef;
    }
    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }



}
