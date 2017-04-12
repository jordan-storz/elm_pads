module Decoders exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline as Pipeline
import Model exposing (SoundBank)


soundBankDecoder : Decode.Decoder SoundBank
