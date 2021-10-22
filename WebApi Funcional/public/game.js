const boton1 = document.getElementById('progreso');
const boton2 = document.getElementById('tutorial');
const url = window.location.href;
const id = url.split('=')[1];

boton1.addEventListener('click', () => {
  window.open('../cart.html?user_id=' + id);
});

boton2.addEventListener('click', () => {
  window.open('../tutoriales.html?user_id=' + id);
});