const boton1 = document.getElementById('progreso');
const boton2 = document.getElementById('game');
const url = window.location.href;
const id = url.split('=')[1];

boton2.addEventListener('click', () => {
    window.location = 'Game/index.html?user_id=' + id;
});

boton1.addEventListener('click', () => {
    window.location = 'cart.html?user_id=' + id;
});