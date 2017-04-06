const { Observable } = require('rxjs');
const app = require('./elm-app');

module.exports = function(audios) {
  const stopped_ = Observable.fromEvent(audios, 'ended');
  const played_  = Observable.fromEvent(audios, 'play');


  stopped_.subscribe(event => {
    let idName = event.target.parentNode.getAttribute('id');
    app.ports.stopSound.send(idName);
  });
}
