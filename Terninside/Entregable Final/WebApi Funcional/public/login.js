const boton = document.getElementById('boton_ing');

const email = document.getElementById('email');
const password = document.getElementById('password');

boton.addEventListener('click', () => {
  axios({
    method: 'GET',
    url: 'http://localhost:4000/api/json/loginPlayer/' + email.value
  })
    .then(res => {
      //const userInfo = res.data;
      console.log(res.data);
      
      if (res.data[0].Password == password.value && res.data[0].EsAdministrador==1) {
        window.location = 'admin.html';
      } 
      else if(res.data[0].Password == password.value && res.data[0].EsAdministrador==0){
        window.location = 'Game/index.html?user_id=' + res.data[0].IDUsuario;
      }
      else {
        alert(`Datos incorrectos`);
      }
    })
    .catch(err => console.log(err));
});

