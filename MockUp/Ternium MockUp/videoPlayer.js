window.addEventListener('load', () => {
    const id = localStorage.getItem('id')
    videoTitle.innerHTLM = id;
    if (id === null) {
        setDefaultValues();
    } else {
        setValues(id);
        localStorage.removeItem('id');
    }
})

const video = document.getElementById('video');
// const videoTitleOut = document.getElementById('videoTitle');

btnNext.addEventListener('click', nextVideo);
btnPrev.addEventListener('click', prevVideo);

const videos = ["recursos.mp4", "edificios.mp4", "logistica.mp4", "contratos.mp4", "progreso.mp4", "ajustes.mp4", "miniJuegoExploracion.mp4", "miniJuegoLaberinto.mp4", "miniJuegoAleacion.mp4", "miniJuegoWordQuiz.mp4", "capacitacionEntregas.mp4", "capacitacionFabricacion.mp4", "capacitacionTerminologia.mp4"];
// const videos = ["video.mp4", "noExiste.mp4", "video.mp4"];
// const videoTitles = ["Video 1", "Video 2", "Video 3"];
const videoTitles = ["Manejo de recursos", "Uso de edificios", "Logística", "Contratos", "Progreso", "Ajustes", "Exploración por Bosque Ternium", "Laberinto Minigame", "Aleación de metales", "Wordquiz", "Generación de entregas", "Proceso de fabricación", "Terminología"];
let vidPlaying = 0;

function nextVideo() {
    if (vidPlaying < videos.length - 1) {
        vidPlaying++;
    } else {
        vidPlaying = 0;
    }
    //Cambiar a /videos
    video.src = "images/" + videos[vidPlaying];
    videoTitle.innerHTML = videoTitles[vidPlaying];
}

function prevVideo() {
    if (vidPlaying > 0) {
        vidPlaying--;
    } else {
        vidPlaying = videos.length - 1;
    }
    //Cambiar a /videos
    video.src = "images/" + videos[vidPlaying];
    videoTitle.innerHTML = videoTitles[vidPlaying];
}

function setValues(id) {
    videoTitle.innerHTML = videoTitles[id];
    video.src = "images/" + videos[id];
    //Cambiar a /videos
}

function setDefaultValues() {
    videoTitle.innerHTML = 'Tutorial No Disponible';
}