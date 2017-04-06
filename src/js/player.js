const app = require('./elm-app');
const $ = require('../../node_modules/jquery/dist/jquery.js');
const eventStream = require('./event-streams.js');


app.ports.initialize.subscribe(() => {
  startEventStreams();
});

function startEventStreams() {
  const audios = document.getElementsByTagName('audio');
  eventStream(audios);
}

app.ports.playSound.subscribe(sound => {
  let audio = document.querySelector(`#${sound.idName} audio`);
  if (audio.currentTime == 0) {
    audio.play();
  } else {
    audio.currentTime = 0;
  }
});
