/**
 * Created by snehalpatil on 5/30/18.
 */
/**
 * Created by snehalpatil on 5/31/17.
 */

//This is a javascript file with its top level require directives
//= require jquery
//= require_tree views
//= require_self



function validateForm()
{

    console.log("This is my javascript manifest");
    //document.getElementById("formContentPanel").style.display = "block";//if you set display:none, it hides the entire element
    document.upform.submit();


}




function loadOnSubmit()
{
    document.getElementById("formContentPanel").style.display = "block";//if you set display:none, it hides the entire element
    document.upform.submit();

    //document.forms["upform"].submit();

}


function validateString(elem){
    console.log("in validation number");
    var alphaExp = /^[/\n|a-zA-Z_-]+$/;
    if(elem.value.match(alphaExp)){
        return true;
    }else{
        alert("Only String values are  allowed for input field ");
        elem.focus();
        return false;
    }
}

function validateNumber(elem){
    console.log("in validation number");
    var alphaExp = /^[0-9]+$/;
    if(elem.value.match(alphaExp)){
        return true;
    }else{
        alert("Only numbers are  allowed for input field");
        elem.focus();
        return false;
    }
}

function show_prompt() {

    var weighterror = true;
    var nameerror = true;
    var exterror = true;

    console.log("in function");
    var inputcust = document.getElementById("inputcusti");
    var inputamin = document.getElementById("inputammino");
    var amiaci = document.getElementById("amiaci");

    var alphaExp = /^[0-9.]+$/;
    if (inputcust.value.match(alphaExp)) {

        weighterror = false;
        console.log("in the inputcust loop");
        console.log(inputcust.value);
    }
    console.log(weighterror);
    var stringtest = /^[/\n|a-zA-Z_-]+$/;
    if(inputamin.value.match(stringtest))
    {
        nameerror = false;
    }

    if (amiaci.value.match(stringtest))
    {
        exterror= false;
    }

    if (weighterror)
    {
        alert("Only numbers are allowed for weight field");

    }
    else if(nameerror)
    {
        alert("Only String values in the name field");

    }
    else if(exterror)
    {
        alert("Only String values in extension field");
    }
    else{

        console.log(inputamin.value);
        var select = document.getElementById("ori");
        var option = document.createElement('option');
        option.text = option.value = inputamin.value +" ("+inputcust.value+") ("+amiaci.value+") ";
        select.add(option, 0);


    }







}