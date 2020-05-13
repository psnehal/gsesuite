package gsesuite;

import java.util.List;

/**
 * Created by snehalpatil on 1/15/19.
 */
public class ReverseQueryOutput {
    public String getTransf() {
        return transf;
    }

    public void setTransf(String transf) {
        this.transf = transf;
    }

    public Integer getSigcount() {
        return sigcount;
    }

    public void setSigcount(Integer sigcount) {
        this.sigcount = sigcount;
    }

    public Integer getTotalcount() {
        return totalcount;
    }

    public void setTotalcount(Integer totalcount) {
        this.totalcount = totalcount;
    }

    public String getTfegid() {
        return tfegid;
    }

    public void setTfegid(String tfegid) {
        this.tfegid = tfegid;
    }

    public List<peResultsFnames> getFnames() {
        return fnames;
    }

    public void setFnames(List<peResultsFnames> fnames) {
        this.fnames = fnames;
    }

    String transf;
    Integer sigcount;
    Integer totalcount;
    String tfegid;

    public Double getPvalavg() {
        return pvalavg;
    }

    public void setPvalavg(Double pvalavg) {
        this.pvalavg = pvalavg;
    }

    Double pvalavg;

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    String fullname;

    List<peResultsFnames> fnames;







}
