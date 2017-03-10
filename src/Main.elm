import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Svg exposing (..)
import Svg.Attributes as Attr exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { units : Int
    , x : Int
    , y : Int
    }


initialModel : Model
initialModel =
    { units = 0
    , x = 60
    , y = 60
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


type Msg
    = NoOp
    | MoveCircle


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        MoveCircle ->
            ( { model | x = model.x + 50 }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ Html.text "Hello, world!"
        , Html.text (toString model)
        , button [ onClick MoveCircle ] [ Html.text "Move" ]
        , svg [ Attr.width "1000px" ] [ myCircle model ]
        ]


myCircle {x, y} =
    circle [ Attr.cx (toString x), Attr.cy (toString y), r "50" ] []
