const boton1 = document.getElementById('tutorial');
const boton2 = document.getElementById('game');
var url = window.location.href;
var id = url.split('=')[1];

boton2.addEventListener('click', () => {
    window.location = 'Game/index.html?user_id=' + id;
});

boton1.addEventListener('click', () => {
    window.location = 'tutoriales.html?user_id=' + id;
});