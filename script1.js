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