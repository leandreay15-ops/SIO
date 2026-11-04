function somme()
{
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) + Number(b);
  
    document.getElementById("resultat").value=c;
}

function soustraction()
{
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) - Number(b);
  
    document.getElementById("resultat").value=c;
}

function produit()
{
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) * Number(b);
  
    document.getElementById("resultat").value=c;
}

function division() {

    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;

    if (Number(b) === 0) {
        document.getElementById("resultat").value = "Erreur division par 0";
        return;
    }

    var c = Number(a) / Number(b);
    document.getElementById("resultat").value = c;
}

function parité()
{
    var x = document.getElementById("t1").value
    if (x % 2 ==0){
        document.getElementById("parité").value = " Paire "
    }
    else{
        document.getElementById("parité").value = " Impaire "
    }
}

function permutation() {
    let n1 = document.getElementById("t1").value;
    let n2 = document.getElementById("t2").value;

    let temp;

    temp = n1;
    n1 = n2;
    n2 = temp;

    document.getElementById("t1").value = n1;
    document.getElementById("t2").value = n2;
}

function effacer()
{
    var a = document.getElementById("t1").value="";
    var b = document.getElementById("t2").value="";
    var c = document.getElementById("resultat").value="";
    document.getElementById("parité").value = "";
}



