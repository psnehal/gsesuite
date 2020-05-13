/**
 * Created by snehalpatil on 5/30/18.
 */
function expandAdvancedOptions() {

    document.getElementById("more").innerHTML = '<span class="text">&nbsp;&nbsp; Empirically modeling the relationship between peak and '
        + 'locus length relaxes the explicit assumptions about the relationship underlying existing tests '
        + 'For example, Fishers exact test assumes that GO term membership is not related to the probability '
        + 'a gene will have at least one peak, which is satisfied when each gene has an equal probability of '
        + 'being assigned at least one peak. The binomial test (implemented in the GREAT software) assumes '
        + 'that the number of peaks assigned to a gene is proportional to its locus length and that no '
        + 'extra-variability over that expected for the binomial distribution exists in the dataset. '
        + 'Assumptions of both tests are violated in many ChIP-Seq datasets.</span> <a href = "#" onclick="closeExp()">less</a>';

}

function closeExp() {
    document.getElementById("more").innerHTML = '<a href = "#" onclick="expandAdvancedOptions()">more</a>';
}

function selectAllGO() {

    if (document.getElementById("go").checked == false) {
        document.getElementById("gobio").checked = false;
        document.getElementById("gocell").checked = false;
        document.getElementById("gomol").checked = false;
    } else {
        document.getElementById("gobio").checked = true;
        document.getElementById("gocell").checked = true;
        document.getElementById("gomol").checked = true;
    }
}

function selectAllDb(source)

{

    var checked = false;

    var checkboxesSel = document.getElementsByName('slist2');
    checked = document.getElementsByName('slist2').checked;
    // alert(checkboxesSel[0].checked);
    var allcheckboxes = document.getElementsByName('slist');
    console.log(allcheckboxes.length);

    console.log("its iniside for loop");

    if (checkboxesSel[0].checked) {
        for (var i = 0; i < allcheckboxes.length; i++) {
            if (allcheckboxes[i].value == 'custom') {

                allcheckboxes[i].checked = false;

            } else {

                allcheckboxes[i].checked = true;

            }

        }
    } else {

        for (var i = 0; i < allcheckboxes.length; i++) {

            allcheckboxes[i].checked = false;

        }

    }

}

function selectCustomFile() {

    var checkboxesAll = document.getElementsByName('slist2');
    var checkboxesInd = document.getElementsByName('slist');
    console.log(checkboxesInd.length);

    for (var i = 0, n = checkboxesInd.length; i < n; i++) {
        if (checkboxesInd[i].value == 'custom') {

            checkboxesInd[i].checked = true;

        } else {

            checkboxesInd[i].checked = false;
            checkboxesAll[0].checked = false;
            checkboxesInd[i].disabled = true;

        }

    }

}

function doalert(checkboxElem) {
    if (checkboxElem.checked) {
        alert("hi");
    } else {
        alert("bye");
    }
}

function removeAllOptions() {
    document.getElementById("supgeneset").innerHTML = "";
}

function selectRangeCheck() {
    var sglist = document.getElementById("sglist");
    var sglistIndex = sglist.selectedIndex;
    var selection = sglist.options[sglistIndex].value;

    if (document.upform.ismappable[1].checked) {

        var list = "";
        document.getElementById("rangeCheck").innerHTML = list;

    }
    if (document.upform.ismappable[0].checked && selection == "hg19") {

        var list = '<ul class="checklist">'
            + '<td align="right" valign="top"><span class="formText">Read Length</span></td>'
            + '<td>'
            + '<ulclass="checklist">'
            + '<li><input type="radio" name="rc" value="24"  /><span class="formText">24</span></li>'
            + '<li><input type="radio" name="rc" value="36"  /><span class="formText">36</span></li>'
            + '<li><input type="radio" name="rc" value="40" /><span class="formText">40</span></li>'
            + '<li><input type="radio" name="rc" value="50"  /><span class="formText">50</span></li>'
            + '<li><input type="radio" name="rc" value="75"/><span class="formText">75</span></li>'
            + '<li><input type="radio" name="rc" value="100" /><span class="formText">100</span></li>'
            + '<li><input type="radio" name="rc" value="user" onClick="userDefMappa()" /><span class="formText">User defined</span></li>'
            + '</ul>' + '</td>';

        document.getElementById("rangeCheck").innerHTML = list;
    } else if (document.upform.ismappable[0].checked && selection == "mm9") {

        var list = '<ul class="checklist">'
            + '<td align="right" valign="top"><span class="formText">Read Length</span></td>'
            + '<td>'
            + '<ulclass="checklist">'
            + '<li><input type="radio" name="rc" value="36"  /><span class="formText">36</span></li>'
            + '<li><input type="radio" name="rc" value="40" /><span class="formText">40</span></li>'
            + '<li><input type="radio" name="rc" value="50"  /><span class="formText">50</span></li>'
            + '<li><input type="radio" name="rc" value="75"/><span class="formText">75</span></li>'
            + '<li><input type="radio" name="rc" value="100"/><span class="formText">100</span></li>'
            + '<li><input type="radio" name="rc" value="user" onClick="userDefMappa()" /><span class="formText">User defined</span></li>'
            + '<li><div id ="file"></div></li>' + '</ul>' + '</td>';

        document.getElementById("rangeCheck").innerHTML = list;
    } else if (document.upform.ismappable[0].checked && selection == "") {
        alert("Please select supported genome to see specific read lengths");
        var list = '<ul>'
            + '<li><input type="radio" name="ismappable" value="T" onClick="selectRangeCheck(this)"/> <span class="formText">True</span></li>'
            + '<li><input type="radio" name="ismappable" value="F" onClick="selectRangeCheck(this)" /><span class="formText">False</span></li>'
            + '</ul>';
        document.getElementById("mapp").innerHTML = list;
    }

}

function selectMappaOption() {

    var sglist = document.getElementById("sglist");
    var sglistIndex = sglist.selectedIndex;
    var selection = sglist.options[sglistIndex].value;
    console.log(selection);
    if (selection.includes("rn")) {
        var list = '<ul>'
            + '<li><input type="radio" name="ismappable" value="F" checked="checked"  /><span class="formText">False </span> <br/>'
            + '<span class="footnote"> Mappability is only available for hg19 and mm9 </span></li>'
            + '</ul>'
            + '</div>'
            + '</td>'
            + '</tr>';
        console.log("inside if loop of rat");
        document.getElementById("mapp").innerHTML = list;
        document.upform.isDatabaseExternal.value = 'true';

        var list2 = '<ul class="checklist">'
            + '<li><label>Functional Annotations</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="biocarta_pathway" type="checkbox"/><a href="http://www.biocarta.com/">Biocarta Pathway</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="ehmn_pathway_gene" type="checkbox"/><a href="http://www.ehmn.bioinformatics.ed.ac.uk">EHMN Metabolic Pathways</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GO" type="checkbox" id="go" onclick="selectAllGO()"/><a href="http://www.geneontology.org/">GO</a>'
            + '</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/><a href="http://www.geneontology.org/">GO Biological Process</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GOCC" id="gocell" type="checkbox"/><a href="http://www.geneontology.org/">GO Cellular Component</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GOMF" id="gomol" type="checkbox"/><a href="http://www.geneontology.org/">GO Molecular Function</a>'
            + '</label>'
            + '</li>'
            + '</ul></li>'
            + '<li><label><input name="slist" value="kegg_pathway" type="checkbox"/><a href="http://www.genome.jp/kegg/">KEGG Pathway</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="panther_pathway" type="checkbox"/><a href="http://www.pantherdb.org/pathway/">Panther Pathway</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="pfam" type="checkbox"/><a href="http://pfam.sanger.ac.uk/">pFAM</a>'
            + '<li><label><input name="slist" value="reactome" type="checkbox"/><a href="http://www.reactome.org/">Reactome</a>'
            + '</label>'
            + '</li>'
            + '</ul></li>'
            + '<li><label>Literature Derived</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="mesh" type="checkbox"/><a href="http://gene2mesh.ncibi.org/">MeSH</a>'
            + '</label>'
            + '</li>'
            +

            '</ul></li>'
            +

            '</ul>'
            + '<br/>'
            + '<li><label>Select All Datatbases</label>'
            + '<ul>'
            + '<li><label><input name="slist2"  type="checkbox"  onclick="selectAllDb(this)"/><a href="http://www.ncbi.nlm.nih.gov/sites/entrez?db=gene">Select All</a>'
            + '</ul>' + '</ul>';

        document.getElementById("databaseList").innerHTML = list2;
        document.getElementById("rangeCheck").innerHTML = "";

        var list3 = '<ul class= "b">'
            + '<li><input type="radio" name="ld" value="1kb" /><span class="formText"> <1kb</span><br />'
            + '<span class="footnote">(only use peaks within 1kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="5kb"  /><span class="formText">5kb</span><br />'
            + '<span class="footnote">(only use peaks within 5kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="10kb"  /><span class="formText"> < 10kb</span><br />'
            + '<span class="footnote">(only use peaks within 10kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="10kb_and_more_upstream"  /><span class="formText"> > 10kb upstream</span><br />'
            + '<span class="footnote">(only use peaks within 10kb and more upstream of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="exon" onClick="warnForFet(this)"/><span class="formText">Exon</span><br />'
            + '<span class="footnote">(only use peaks that fall within an annotated exon)</span></li>'
            + '<li><input type="radio" name="ld" value="intron" onClick="warnForFet(this)"/><span class="formText">Intron</span><br />'
            + '<span class="footnote">(only use peaks that fall within an annotated itron)</span></li>'
            + '<li><input type="radio" name="ld" value="nearest_gene" onClick="warnForFet(this)"  /><span class="formText">Nearest Gene</span><br />'
            + '<span class="footnote">(use all peaks; assign peaks to the nearest gene defined by transcription start and end sites)</span></li>'
            + '<li><input type="radio" name="ld" value="nearest_tss" checked="checked" onClick="warnForFet(this)"/><span class="formText">Nearest TSS</span><br />'
            + '<span class="footnote">(use all peaks; assign peaks to the gene with the closest TSS)</span></li>'
            + '<li><input type="radio" name="ld" value="user" onClick="UploadLdFile(this)"/><span class="formText">User Defined</span><br />'
            + '<span class="footnote">(user can input their own locus definition)</span></li>'
            + '</ul>';

        document.getElementById("locusdefinations").innerHTML = list3;

    } else if (selection.includes('mm')) {

        console.log("in mm");

        var list = '<ul class="checklist">'
            + '<li><label>Functional Annotations</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="biocarta_pathway" type="checkbox"/><a href="http://www.biocarta.com/">Biocarta Pathway</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="ehmn_pathway_gene" type="checkbox"/><a href="http://www.ehmn.bioinformatics.ed.ac.uk">EHMN Metabolic Pathways</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GO" type="checkbox" id="go" onclick="selectAllGO()"/><a href="http://www.geneontology.org/">GO</a>'
            + '</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/><a href="http://www.geneontology.org/">GO Biological Process</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GOCC" id="gocell" type="checkbox"/><a href="http://www.geneontology.org/">GO Cellular Component</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GOMF" id="gomol" type="checkbox"/><a href="http://www.geneontology.org/">GO Molecular Function</a>'
            + '</label>'
            + '</li>'
            + '</ul></li>'
            + '<li><label><input name="slist" value="kegg_pathway" type="checkbox"/><a href="http://www.genome.jp/kegg/">KEGG Pathway</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="panther_pathway" type="checkbox"/><a href="http://www.pantherdb.org/pathway/">Panther Pathway</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="pfam" type="checkbox"/><a href="http://pfam.sanger.ac.uk/">pFAM</a>'
            + '<li><label><input name="slist" value="reactome" type="checkbox"/><a href="http://www.reactome.org/">Reactome</a>'
            + '</label>'
            + '</li>'
            + '</ul></li>'
            + '<li><label>Literature Derived</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="mesh" type="checkbox"/><a href="http://gene2mesh.ncibi.org/">MeSH</a>'
            + '</label>'
            + '</li>'
            +

            '</ul></li>'
            + '<li><label>Targets</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="drug_bank" type="checkbox"/><a href="http://www.drugbank.ca/">Drug Bank</a>'
            + '</label>'
            + '</li>'
            +

            '<li><label><input name="slist" value="transcription_factors" type="checkbox"/><a href="http://biobase-international.com/index.php?id=transfac">Transcription'
            + 'Factors</a>'
            + '</label>'
            + '</li>'
            + '</ul></li>'
            +

            '<li><label>Other</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="metabolite" type="checkbox"/><a href="http://www.ncibi.org">Metabolite</a>'
            + '</label>'
            + '</li>'
            + '</ul>'
            + '<br/>'
            + '<li><label>Custom</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="custom" type="checkbox"  onchange="selectCustomFile()" /><a href="">Custom</a></label>'
            + '<input id="uploadCustomfile" type="file" name="uploadcustomfile" size="30" class="formObject" onchange="uploadFile()"></li>'
            + '</ul>'
            + '<br/>'
            + '<li><label>Select All Datatbases</label>'
            + '<ul>'
            + '<li><label><input name="slist2"   value="selectall" type="checkbox"  onchange="selectAllDb(this)"/><a href="http://www.ncbi.nlm.nih.gov/sites/entrez?db=gene">SelectAll</a>'
            + '</label>' + '</li>' + '</ul>'

        document.getElementById("databaseList").innerHTML = list;


        if(selection == "mm9")
        {

            var list2 = '<ul>'
                + '<li><input type="radio" name="ismappable" value="T" onClick="selectRangeCheck(this)"/> <span class="formText">True</span></li>'
                + '<li><input type="radio" name="ismappable" value="F" checked="checked" onClick="selectRangeCheck(this)"  /><span class="formText">False</span></li>'
                + '</ul>' + '</div>' + '</td>' + '</tr>';

            console.log("inside human loop");
            document.getElementById("mapp").innerHTML = list2;
        }
        else
        {

            var list2 = '<ul>'
                + '<li><input type="radio" name="ismappable" value="F" checked="checked"  /><span class="formText">False </span> <br/>'
                + '<span class="footnote"> Mappability is only available for hg19 and mm9 </span></li>'
                + '</ul>'
                + '</div>'
                + '</td>'
                + '</tr>';

            console.log("inside if loop of mm10");
            document.getElementById("mapp").innerHTML = list2;
        }

        var list3 = '<ul class= "b">'
            + '<li><input type="radio" name="ld" value="1kb" /><span class="formText"><1kb</span><br />'
            + '<span class="footnote">(only use peaks within 1kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="5kb"  /><span class="formText">5kb</span><br />'
            + '<span class="footnote">(only use peaks within 5kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="10kb"  /><span class="formText"> < 10kb</span><br />'
            + '<span class="footnote">(only use peaks within 10kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="10kb_and_more_upstream"  /><span class="formText"> > 10kb upstream</span><br />'
            + '<span class="footnote">(only use peaks within 10kb and more upstream of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="exon" onClick="warnForFet(this)"/><span class="formText">Exon</span><br />'
            + '<span class="footnote">(only use peaks that fall within an annotated exon)</span></li>'
            + '<li><input type="radio" name="ld" value="intron" onClick="warnForFet(this)"/><span class="formText">Intron</span><br />'
            + '<span class="footnote">(only use peaks that fall within an annotated itron)</span></li>'
            + '<li><input type="radio" name="ld" value="nearest_tss" checked="checked" onClick="warnForFet(this)"/><span class="formText">Nearest TSS</span><br />'
            + '<span class="footnote">(use all peaks; assign peaks to the gene with the closest TSS)</span></li>'
            + '<li><input type="radio" name="ld" value="user" onClick="UploadLdFile(this)"/><span class="formText">User Defined</span><br />'
            + '<span class="footnote">(user can input their own locus definition)</span></li>'
            + '</ul>';

        document.getElementById("locusdefinations").innerHTML = list3;

    }

    else if (selection.includes("hg")) {
        console.log("in hg");
        var list = '<ul class="checklist">'
            + '<li><label>Functional Annotations</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="biocarta_pathway" type="checkbox"/><a href="http://www.biocarta.com/">Biocarta Pathway</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="ehmn_pathway_gene" type="checkbox"/><a href="http://www.ehmn.bioinformatics.ed.ac.uk">EHMN Metabolic Pathways</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GO" type="checkbox" id="go" onclick="selectAllGO()"/><a href="http://www.geneontology.org/">GO</a>'
            + '</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/><a href="http://www.geneontology.org/">GO Biological Process</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GOCC" id="gocell" type="checkbox"/><a href="http://www.geneontology.org/">GO Cellular Component</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GOMF" id="gomol" type="checkbox"/><a href="http://www.geneontology.org/">GO Molecular Function</a>'
            + '</label>'
            + '</li>'
            + '</ul></li>'
            + '<li><label><input name="slist" value="kegg_pathway" type="checkbox"/><a href="http://www.genome.jp/kegg/">KEGG Pathway</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="panther_pathway" type="checkbox"/><a href="http://www.pantherdb.org/pathway/">Panther Pathway</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="pfam" type="checkbox"/><a href="http://pfam.sanger.ac.uk/">pFAM</a>'
            + '<li><label><input name="slist" value="reactome" type="checkbox"/><a href="http://www.reactome.org/">Reactome</a>'
            + '</label>'
            + '</li>'
            + '</ul></li>'
            + '<li><label>Literature Derived</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="mesh" type="checkbox"/><a href="http://gene2mesh.ncibi.org/">MeSH</a>'
            + '</label>'
            + '</li>'
            + '</ul></li>'
            + '<li><label>MSigDB Derived</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="hallmark" type="checkbox"/><a href="http://software.broadinstitute.org/gsea/msigdb/collections.jsp">Hallmark</a></label></li>'
            + '<li><label><input name="slist" value="immunologic" type="checkbox"/><a href=http://software.broadinstitute.org/gsea/msigdb/collections.jsp">Immunologic</a></label></li>'
            + '<li><label><input name="slist" value="oncogenic" type="checkbox"/><a href="http://software.broadinstitute.org/gsea/msigdb/collections.jsp">Oncogenic</a></label></li>'
            + '</ul></li>'
            + '<li><label>Targets</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="ctd" type="checkbox"/><a href="http://ctdbase.org/">Comparative Toxicogenomics Database (CTD) </a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="drug_bank" type="checkbox"/><a href="http://www.drugbank.ca/">Drug Bank</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="microrna" type="checkbox"/><a href=http://software.broadinstitute.org/gsea/msigdb/collections.jsp">MicroRNA</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="transcription_factors" type="checkbox"/><a href="http://biobase-international.com/index.php?id=transfac">Transcription Factors</a>'
            + '</label>'
            + '</li>'
            + '</ul></li>'
            + '<li><label>Interaction</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="protein_interaction_biogrid" type="checkbox"/><a href="https://thebiogrid.org">Protein Interaction BioGRID</a>'
            + '</label>'
            + '</li>'
            + '</ul></li>'
            + '<li><label>Other</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="metabolite" type="checkbox"/><a href="http://www.ncibi.org">Metabolite</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="cytoband" type="checkbox"/><a href="http://www.ncbi.nlm.nih.gov/sites/entrez?db=gene">Cytoband</a>'
            + '</label>'
            + '</li>'
            + '</ul>'
            + '<br/>'
            +

            '<li><label>Custom</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="custom" type="checkbox"  onchange="selectCustomFile()" /><a href="">Custom</a></label>'
            + '<input id="uploadCustomfile" type="file" name="uploadcustomfile" size="30" class="formObject" onchange="uploadFile()"></li>'
            +

            '<p><span class="footnote">To test custom gene sets,file should be defined in tab-delimited text file with the first column geneset ID or name, and the Entrez IDs belonging to the geneset.'
            + 'An example is provided <a href="images/custeg.txt" target="_blank">here</a>.</p></span>'
            + '</ul>'
            + '<br/>'
            +

            '<li><label>Select All Datatbases</label>'
            + '<ul>'
            + '<li><label><input name="slist2"  type="checkbox"  onclick="selectAllDb(this)"/><a href="http://www.ncbi.nlm.nih.gov/sites/entrez?db=gene">Select All</a>'
            + '</ul>' + '</ul>';

        document.getElementById("databaseList").innerHTML = list;
        document.upform.isDatabaseExternal.value = 'false';



        if(selection == "hg19")
        {

            var list2 = '<ul>'
                + '<li><input type="radio" name="ismappable" value="T" onClick="selectRangeCheck(this)"/> <span class="formText">True</span></li>'
                + '<li><input type="radio" name="ismappable" value="F" checked="checked" onClick="selectRangeCheck(this)"  /><span class="formText">False</span></li>'
                + '</ul>' + '</div>' + '</td>' + '</tr>';

            console.log("inside human loop");
            document.getElementById("mapp").innerHTML = list2;
        }
        else
        {

            var list2 = '<ul>'
                + '<li><input type="radio" name="ismappable" value="F" checked="checked"  /><span class="formText">False </span> <br/>'
                + '<span class="footnote"> Mappability is only available for hg19 and mm9 </span></li>'
                + '</ul>'
                + '</div>'
                + '</td>'
                + '</tr>';

            console.log("inside if loop of mm10");
            document.getElementById("mapp").innerHTML = list2;
        }


        document.upform.isDatabaseExternal.value = 'true';

        var list3 = '<ul class= "b">'
            + '<li><input type="radio" name="ld" value="1kb" /><span class="formText"><1kb</span><br />'
            + '<span class="footnote">(only use peaks within 1kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="5kb"  /><span class="formText">5kb</span><br />'
            + '<span class="footnote">(only use peaks within 5kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="10kb"  /><span class="formText"> < 10kb</span><br />'
            + '<span class="footnote">(only use peaks within 10kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="10kb_and_more_upstream"  /><span class="formText"> > 10kb upstream</span><br />'
            + '<span class="footnote">(only use peaks within 10kb and more upstream of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="exon" onClick="warnForFet(this)"/><span class="formText">Exon</span><br />'
            + '<span class="footnote">(only use peaks that fall within an annotated exon)</span></li>'
            + '<li><input type="radio" name="ld" value="intron" onClick="warnForFet(this)"/><span class="formText">Intron</span><br />'
            + '<span class="footnote">(only use peaks that fall within an annotated itron)</span></li>'
            + '<li><input type="radio" name="ld" value="nearest_gene" onClick="warnForFet(this)"  /><span class="formText">Nearest Gene</span><br />'
            + '<span class="footnote">(use all peaks; assign peaks to the nearest gene defined by transcription start and end sites)</span></li>'
            + '<li><input type="radio" name="ld" value="nearest_tss" checked="checked" onClick="warnForFet(this)"/><span class="formText">Nearest TSS</span><br />'
            + '<span class="footnote">(use all peaks; assign peaks to the gene with the closest TSS)</span></li>'
            + '<li><input type="radio" name="ld" value="user" onClick="UploadLdFile(this)"/><span class="formText">User Defined</span><br />'
            + '<span class="footnote">(user can input their own locus definition)</span></li>'
            + '</ul>';

        document.getElementById("locusdefinations").innerHTML = list3;

    } else if (selection.includes("dm")) {

        var list = '<ul class="checklist">'
            + '<li><label>Functional Annotations</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="GO" type="checkbox" id="go" onclick="selectAllGO()"/><a href="http://www.geneontology.org/">GO</a>'
            + '</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/><a href="http://www.geneontology.org/">GO Biological Process</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GOCC" id="gocell" type="checkbox"/><a href="http://www.geneontology.org/">GO Cellular Component</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GOMF" id="gomol" type="checkbox"/><a href="http://www.geneontology.org/">GO Molecular Function</a>'
            + '</label>'
            + '</li>'

            + '</ul></li>'
            + '<li><label><input name="slist" value="reactome" type="checkbox"/><a href="http://www.reactome.org/">Reactome</a>'
            + '</label>'
            + '</li>'
            +

            '</ul></li>'
            +

            '<li><label>Custom</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="custom" type="checkbox"  onchange="selectCustomFile()" /><a href="">Custom</a></label>'
            + '<input id="uploadCustomfile" type="file" name="uploadcustomfile" size="30" class="formObject" onchange="uploadFile()"></li>'
            +

            '<p><span class="footnote">To test custom gene sets,file should be defined in tab-delimited text file with the first column geneset ID or name, and the Entrez IDs belonging to the geneset.'
            + 'An example is provided <a href="images/custeg.txt" target="_blank">here</a>.</p></span>'
            + '</ul>' + '<br/>' + '</ul>';

        document.getElementById("databaseList").innerHTML = list;
        document.upform.isDatabaseExternal.value = 'false';

        var list2 = '<ul>'
            + '<li><input type="radio" name="ismappable" value="F" checked="checked"  /><span class="formText">False </span> <br/>'
            + '<span class="footnote"> Mappability is only available for hg19 and mm9 </span></li>'
            + '</ul>'
            + '</div>'
            + '</td>'
            + '</tr>';

        console.log("inside dm loop");
        document.getElementById("mapp").innerHTML = list2;
        document.upform.isDatabaseExternal.value = 'true';

        var list3 = '<ul class= "b">'
            + '<li><input type="radio" name="ld" value="1kb" /><span class="formText"><1kb</span><br />'
            + '<span class="footnote">(only use peaks within 1kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="5kb"  /><span class="formText">5kb</span><br />'
            + '<span class="footnote">(only use peaks within 5kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="10kb"  /><span class="formText"> < 10kb</span><br />'
            + '<span class="footnote">(only use peaks within 10kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="10kb_and_more_upstream"  /><span class="formText"> > 10kb upstream</span><br />'
            + '<span class="footnote">(only use peaks within 10kb and more upstream of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="exon" onClick="warnForFet(this)"/><span class="formText">Exon</span><br />'
            + '<span class="footnote">(only use peaks that fall within an annotated exon)</span></li>'
            + '<li><input type="radio" name="ld" value="intron" onClick="warnForFet(this)"/><span class="formText">Intron</span><br />'
            + '<span class="footnote">(only use peaks that fall within an annotated itron)</span></li>'
            + '<li><input type="radio" name="ld" value="nearest_gene" onClick="warnForFet(this)"  /><span class="formText">Nearest Gene</span><br />'
            + '<span class="footnote">(use all peaks; assign peaks to the nearest gene defined by transcription start and end sites)</span></li>'
            + '<li><input type="radio" name="ld" value="nearest_tss" checked="checked" onClick="warnForFet(this)"/><span class="formText">Nearest TSS</span><br />'
            + '<span class="footnote">(use all peaks; assign peaks to the gene with the closest TSS)</span></li>'
            + '<li><input type="radio" name="ld" value="user" onClick="UploadLdFile(this)"/><span class="formText">User Defined</span><br />'
            + '<span class="footnote">(user can input their own locus definition)</span></li>'
            + '</ul>';

        document.getElementById("locusdefinations").innerHTML = list3;

    }

    else if (selection == "dre") {

        var list = '<ul class="checklist">'
            + '<li><label>Functional Annotations</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="GO" type="checkbox" id="go" onclick="selectAllGO()"/><a href="http://www.geneontology.org/">GO</a>'
            + '</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/><a href="http://www.geneontology.org/">GO Biological Process</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GOCC" id="gocell" type="checkbox"/><a href="http://www.geneontology.org/">GO Cellular Component</a>'
            + '</label>'
            + '</li>'
            + '<li><label><input name="slist" value="GOMF" id="gomol" type="checkbox"/><a href="http://www.geneontology.org/">GO Molecular Function</a>'
            + '</label>'
            + '</li>'

            + '</ul></li>'
            + '<li><label><input name="slist" value="reactome" type="checkbox"/><a href="http://www.reactome.org/">Reactome</a>'
            + '</label>'
            + '</li>'
            +

            '</ul></li>'
            +

            '<li><label>Custom</label>'
            + '<ul>'
            + '<li><label><input name="slist" value="custom" type="checkbox"  onchange="selectCustomFile()" /><a href="">Custom</a></label>'
            + '<input id="uploadCustomfile" type="file" name="uploadcustomfile" size="30" class="formObject" onchange="uploadFile()"></li>'
            +

            '<p><span class="footnote">To test custom gene sets,file should be defined in tab-delimited text file with the first column geneset ID or name, and the Entrez IDs belonging to the geneset.'
            + 'An example is provided <a href="images/custeg.txt" target="_blank">here</a>.</p></span>'
            + '</ul>' + '<br/>' + '</ul>';


        document.getElementById("databaseList").innerHTML = list;
        document.upform.isDatabaseExternal.value = 'false';

        var list2 = '<ul>'
            + '<li><input type="radio" name="ismappable" value="F" checked="checked"  /><span class="formText">False </span> <br/>'
            + '<span class="footnote"> Mappability is only available for hg19 and mm9 </span></li>'
            + '</ul>'
            + '</div>'
            + '</td>'
            + '</tr>';

        console.log("inside dre loop");
        document.getElementById("mapp").innerHTML = list2;
        document.upform.isDatabaseExternal.value = 'true';

        var list3 = '<ul class= "b">'
            + '<li><input type="radio" name="ld" value="1kb" /><span class="formText"><1kb</span><br />'
            + '<span class="footnote">(only use peaks within 1kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="5kb"  /><span class="formText">5kb</span><br />'
            + '<span class="footnote">(only use peaks within 5kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="10kb"  /><span class="formText"> < 10kb</span><br />'
            + '<span class="footnote">(only use peaks within 10kb of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="10kb_and_more_upstream"  /><span class="formText"> > 10kb upstream</span><br />'
            + '<span class="footnote">(only use peaks within 10kb and more upstream of a transcription start site)</span></li>'
            + '<li><input type="radio" name="ld" value="exon" onClick="warnForFet(this)"/><span class="formText">Exon</span><br />'
            + '<span class="footnote">(only use peaks that fall within an annotated exon)</span></li>'
            + '<li><input type="radio" name="ld" value="intron" onClick="warnForFet(this)"/><span class="formText">Intron</span><br />'
            + '<span class="footnote">(only use peaks that fall within an annotated itron)</span></li>'
            + '<li><input type="radio" name="ld" value="nearest_gene" onClick="warnForFet(this)"  /><span class="formText">Nearest Gene</span><br />'
            + '<span class="footnote">(use all peaks; assign peaks to the nearest gene defined by transcription start and end sites)</span></li>'
            + '<li><input type="radio" name="ld" value="nearest_tss" checked="checked" onClick="warnForFet(this)"/><span class="formText">Nearest TSS</span><br />'
            + '<span class="footnote">(use all peaks; assign peaks to the gene with the closest TSS)</span></li>'
            + '<li><input type="radio" name="ld" value="user" onClick="UploadLdFile(this)"/><span class="formText">User Defined</span><br />'
            + '<span class="footnote">(user can input their own locus definition)</span></li>'
            + '</ul>';

        document.getElementById("locusdefinations").innerHTML = list3;

    }

    else {

        var list2 = '<ul>'
            + '<li><input type="radio" name="ismappable" value="F" checked="checked"  /><span class="formText">False </span> <br/>'
            + '<span class="footnote"> Mappability is only available for hg19 and mm9 </span></li>'
            + '</ul>'
            + '</div>'
            + '</td>'
            + '</tr>';

        console.log("inside other loop");
        document.getElementById("mapp").innerHTML = list;
        document.upform.isDatabaseExternal.value = 'true';

    }

}

function userDefMappa() {

    var radioButtons = document.getElementsByName("rc");
    for (var x = 0; x < radioButtons.length; x++) {
        if (radioButtons[x].checked) {
            console.log(radioButtons[x].value);
            if (radioButtons[x].value == "user") {

                var list = '<ul class="checklist">'
                    + '<td align="right" valign="top"><span class="formText">Read Length</span></td>'
                    + '<td>'
                    + '<ulclass="checklist">'

                    + '<li><input type="radio" name="rc" value="user" checked="checked" /><span class="formText">User defined</span></li>'
                    + '<li>Input Mappability File<input id="mappaFile" type="file" name="mappaFile" size="30" class="formObject"> </li>'

                    + '</ul>' + '</td>';

                document.getElementById("rangeCheck").innerHTML = list;

            }
        }

    }

}

function UploadLdFile() {

    var radioButtons = document.getElementsByName("ld");

    console.log(radioButtons.value);
    for (var x = 0; x < radioButtons.length; x++) {
        if (radioButtons[x].checked) {
            console.log(radioButtons[x].value);
            if (radioButtons[x].value == "user") {

                var list = '<ul class="checklist">'
                    + '<ulclass="checklist">'

                    + '<li><input type="radio" name="ld" value="user" checked="checked" /><span class="formText">User defined</span></li>'
                    + '<span class="formText">Input Locus definition File</span> <input id="ldFile" type="file" name="ldFile" size="30" class="formObject"> '

                    + '</ul>' + '</td>';

                document.getElementById("locusdefinations").innerHTML = list;

            }
        }

    }

}

function checkPeakThr() {

    var no = document.getElementById('peakthr');
    var numValue = Number(no.value);
    console.log(numValue);
    console.log(no.value);

    if (numValue < 0) {

        filterValueError = "Value should not be less than 5";
        alert(filterValueError);
    } else if (isNaN(numValue)) {
        filterValueError2 = "value is not numeric";
        alert(filterValueError2);
    }
}

function warnForFet() {
    console.log("1");
    var selection = 0;
    var range = document.getElementsByName("method");
    for (var i = 0; i < range.length; i++) {
        console.log(range.length);
        if (range[i].checked) {
            selection = range[i].value;
        }
    }
    var selection2 = 0;
    var range2 = document.getElementsByName("ld");
    for (var i = 0; i < range2.length; i++) {
        console.log(range2.length);
        if (range2[i].checked) {
            selection2 = range2[i].value;
        }
    }
    if (selection == "fet"
        && (selection2 == "exon" || selection2 == "nearest_gene" || selection2 == "nearest_tss")) {
        alert("There is bias if you select Fisher's exact test with "
            + selection2);

    }

}

function checkOutname() {
    var name = document.getElementsByName("outname");
    console.log(name);

}

function validate(elem) {
    console.log("in validation");
    var alphaExp = /^[a-zA-Z0-9_-]+$/;
    if (elem.value.match(alphaExp)) {
        return true;
    } else {
        alert("Special Characters and Spaces are not allowed for Analysis Name");
        elem.focus();
        return false;
    }
}

function selectMethod() {

    var checker = document.getElementById('checkme');

    var radios = document.getElementsByName('method');

    for (var i = 0, length = radios.length; i < length; i++) {
        if (radios[i].checked) {
            // do whatever you want with the checked radio

            if (radios[i].value == "polyenrich") {
                checker.disabled = false;

            } else if (radios[i].value == "hybrid") {
                checker.disabled = false;

            } else {
                checker.checked = false;
                checker.disabled = true;

            }

            // only one radio can be logically checked, don't check the rest
            break;
        }
    }

}
