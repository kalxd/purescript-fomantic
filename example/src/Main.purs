module Main where

import Prelude

import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as D
import Concur.React.Props as P
import Concur.React.Run (runWidgetInDom)
import Effect (Effect)

import Concur.Fomantic as B

homePage :: forall a. Widget HTML a
homePage = D.div [P.className "ui container"] [B.uiButton [] [] [D.text "sb"]]

runApp :: forall a. Widget HTML a -> Effect Unit
runApp = runWidgetInDom "app"

main :: Effect Unit
main = runApp homePage
