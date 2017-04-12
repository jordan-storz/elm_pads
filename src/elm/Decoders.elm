module Decoders exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline as Pipeline
import Model exposing (SoundBank, Sound)


soundDecoder : Decode.Decoder Sound
soundDecoder =
    Pipeline.decode Sound
        |> Pipeline.required "url" Decode.string
        |> Pipeline.required "name" Decode.string


soundBankDecoder : Decode.Decoder SoundBank
soundBankDecoder =
    Decode.array soundDecoder
