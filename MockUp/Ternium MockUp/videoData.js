vid1.addEventListener('click', () => passValues(0));
vid2.addEventListener('click', () => passValues(1));
vid3.addEventListener('click', () => passValues(2));
vid4.addEventListener('click', () => passValues(3));
vid5.addEventListener('click', () => passValues(4));
vid6.addEventListener('click', () => passValues(5));
vid7.addEventListener('click', () => passValues(6));
vid8.addEventListener('click', () => passValues(7));
vid9.addEventListener('click', () => passValues(8));
vid10.addEventListener('click', () => passValues(9));
vid11.addEventListener('click', () => passValues(10));
vid12.addEventListener('click', () => passValues(11));
vid13.addEventListener('click', () => passValues(12));

function passValues(idNum) {
    localStorage.setItem('id', idNum);
    return false;
}