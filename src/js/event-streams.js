const { Observable } = require('rxjs');
const app = require('./elm-app');

const createEventStream = Observable.fromEvent;

module.exports = function(audios) {
  const ended_ = createEventStream(audios, 'ended');
  const paused_ = createEventStream(audios, 'pause');
  const played_  = createEventStream(audios, 'play');

  const stopped_ = Observable.merge(ended_, paused_);


  stopped_.subscribe(event => {
    let idName = event.target.parentNode.getAttribute('id');
    app.ports.soundStopped.send(idName);
  });
}
