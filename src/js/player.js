const app = require('./elm-app');
const $ = require('../../node_modules/jquery/dist/jquery.js');
const eventStream = require('./event-streams.js');


app.ports.initialize.subscribe(() => {
  console.log('init');
  startEventStreams();
});

function startEventStreams() {
  const audios = document.getElementsByTagName('audio');
  eventStream(audios);
}

app.ports.playSound.subscribe(pad => {
  let audio = document.querySelector(`#pad-${pad.id} audio`);
  if (audio.currentTime == 0) {
    audio.play();
  } else {
    audio.currentTime = 0;
  }
});

app.ports.stopSound.subscribe(pad => {
  let audio = document.querySelector(`#pad-${pad.id} audio`);
  audio.pause();
  audio.currentTime = 0;
});
