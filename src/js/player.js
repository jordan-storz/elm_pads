const app = require('./elm-app');
const $ = require('../../node_modules/jquery/dist/jquery.js');


app.ports.playSound.subscribe(sound => {
  document.getElementById(sound.name).play();
})
