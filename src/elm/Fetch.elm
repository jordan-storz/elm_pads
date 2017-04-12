module Fetch exposing (..)

import Messages exposing (..)
import Decoders
import Http


fetchSoundBank : String -> Cmd Msg
fetchSoundBank username =
    Http.send ReceiveSoundBank
        (Http.get (makeUrl username) Decoders.soundBankDecoder)


soundEndpoint : String
soundEndpoint =
    "https://earbyter.herokuapp.com/api/sounds?author="


makeUrl : String -> String
makeUrl username =
    soundEndpoint ++ username
