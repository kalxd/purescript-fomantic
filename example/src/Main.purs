module Main where

import Prelude

import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as D
import Concur.React.Props as P
import Concur.React.Run (runWidgetInDom)
import Effect (Effect)

mybutton :: Int -> Widget HTML Int
mybutton n = do
  void $ D.button [P.className "ui primary button", P.onClick] [D.text $ show n]
  mybutton $ n + 1

main :: Effect Unit
main = do
  runWidgetInDom "app" $ mybutton 10
