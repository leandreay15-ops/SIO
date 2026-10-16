function direBonjour() {
    document.getElementById("message").textContent = "Bonjour ! Bienvenue sur ma page.";
}

function afficherDate() {
    var maintenant = new Date();
    var texte = "Nous sommes le " + maintenant.toLocaleDateString("fr-FR") +
                " et il est " + maintenant.toLocaleTimeString("fr-FR") + ".";
    document.getElementById("message").textContent = texte;
}

function changerCouleur() {
    var couleurs = ["#ffeaa7", "#fab1a0", "#81ecec", "#a29bfe", "#b2f2bb"];
    var indice = Math.floor(Math.random() * couleurs.length);
    document.body.style.backgroundColor = couleurs[indice];
    document.getElementById("message").textContent = "Nouvelle couleur de fond : " + couleurs[indice];
}

function nombreAleatoire() {
    var nombre = Math.floor(Math.random() * 100) + 1;
    document.getElementById("message").textContent = "Votre nombre aléatoire est : " + nombre;
}

function effacer() {
    document.getElementById("message").textContent = "";
}

function verifAge() {
	let n1 = prompt("Donnez votre âge : ");
 
	if (n1 < 18) {
        document.write("Vous êtes mineur");
  document.body.style.backgroundColor = "red"
	}
	else {
        document.write("Vous êtes majeur");
    	document.body.style.backgroundColor = "green"
	}
}
function notes() {
    let n2 = Number(prompt("Donnez une première note : "));
    let n3 = Number(prompt("Donnez une deuxième note : "));
    let n4 = Number(prompt("Donnez une troisième note : "));
    
    let somme = n2 + n3 + n4;
    let moyenne = somme / 3;
    
    document.getElementById("message").textContent = "La somme est : " + somme + " et la moyenne est : " + moyenne;
}