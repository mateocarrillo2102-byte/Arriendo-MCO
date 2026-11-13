const body = document.body;
const modeToggle = document.getElementById("modeToggle");
const esOscuroInicial = localStorage.getItem("modo") === "oscuro";
// Esto corre en TODAS las páginas
body.classList.toggle("modo-oscuro", esOscuroInicial);
// Esto solo corre si la página tiene el botón
if (modeToggle) {
  modeToggle.textContent = esOscuroInicial ? "🌞" : "🌙";
  modeToggle.addEventListener("click", () => {
    const isOscuro = body.classList.toggle("modo-oscuro");
    localStorage.setItem("modo", isOscuro ? "oscuro" : "claro");
    modeToggle.textContent = isOscuro ? "🌞" : "🌙";
  });
}