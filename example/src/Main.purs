module Main where

import Prelude

import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as D
import Concur.React.Props as P
import Concur.React.Run (runWidgetInDom)
import Effect (Effect)

mybutton :: forall a. Widget HTML a
mybutton  = D.button [P.className "ui primary button"] [D.text "sb"]

main :: Effect Unit
main = do
  runWidgetInDom "app" mybutton
