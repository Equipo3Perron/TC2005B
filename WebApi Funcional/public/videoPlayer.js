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

btnNext.addEventListener('click', nextVideo);
btnPrev.addEventListener('click', prevVideo);

const videos = ["recursos.mp4", "edificios.mp4", "logistica.mp4", "contratos.mp4", "progreso.mp4", "ajustes.mp4", "miniJuegoExploracion.mp4", "miniJuegoLaberinto.mp4", "miniJuegoAleacion.mp4", "miniJuegoWordQuiz.mp4", "capacitacionEntregas.mp4", "capacitacionFabricacion.mp4", "capacitacionTerminologia.mp4"];
const videoTitles = ["Manejo de recursos", "Uso de edificios", "Logística", "Contratos", "Progreso", "Ajustes", "Exploración por Bosque Ternium", "Laberinto Minigame", "Aleación de metales", "Wordquiz", "Generación de entregas", "Proceso de fabricación", "Terminología"];

let vidPlaying = 0;

function nextVideo() {
    if (vidPlaying < videos.length - 1) {
        vidPlaying++;
    } else {
        vidPlaying = 0;
    }
    video.src = "assets/videos/" + videos[vidPlaying];
    videoTitle.innerHTML = videoTitles[vidPlaying];
}

function prevVideo() {
    if (vidPlaying > 0) {
        vidPlaying--;
    } else {
        vidPlaying = videos.length - 1;
    }

    video.src = "assets/videos/" + videos[vidPlaying];
    videoTitle.innerHTML = videoTitles[vidPlaying];
}

function setValues(id) {
    videoTitle.innerHTML = videoTitles[id];
    video.src = "assets/videos/" + videos[id];
}

function setDefaultValues() {
    videoTitle.innerHTML = 'Tutorial No Disponible';
}