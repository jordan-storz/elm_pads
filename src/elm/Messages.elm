module Messages exposing (..)

import Http
import Model exposing (Sound, Pad, SoundBank)


type Msg
    = PlaySound Pad
    | KeyPlaySound Int
    | StopSound Pad
    | KeyStopSound Int
    | StoppedSound Int
    | FetchSoundBank
    | ReceiveSoundBank (Result Http.Error SoundBank)
    | NoOp
