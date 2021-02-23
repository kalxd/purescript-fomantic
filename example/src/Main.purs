module Main where

import Prelude

import Concur.Fomantic.Internal.DOM (UIWidget)
import Concur.React.Run (runWidgetInDom)
import Control.Alt ((<|>))
import Data.Foldable (oneOf)
import Effect (Effect)
import Effect.AVar as EV
import Effect.Aff (Milliseconds(..), delay)
import Effect.Aff.AVar as AV
import Effect.Aff.Class (liftAff)
import Effect.Class (liftEffect)
import Effect.Console (logShow)
import Page.Button (buttonPage)
import Page.Home (homePage)
import Routing.Hash (matches)
import Routing.Match (Match, end, lit, root)

data AppRoute = HomeR
              | ButtonR

instance showAppRoute :: Show AppRoute where
  show HomeR = "Home"
  show ButtonR = "Button"

homeR :: Match AppRoute
homeR = end $> HomeR

buttonR :: Match AppRoute
buttonR = lit "button" *> end $> ButtonR

appRoute :: Match AppRoute
appRoute = root *> oneOf [homeR, buttonR]

pickWidget :: forall a. AppRoute -> UIWidget a
pickWidget HomeR = homePage
pickWidget ButtonR = buttonPage

app :: forall a. UIWidget a
app = do
  routeRef <- liftEffect do
    var <- EV.empty
    void $ matches appRoute \_ route -> do
      void $ EV.tryPut route var
    pure var
  let awaitRoute = liftAff do
        ref <- AV.take routeRef
        liftEffect $ logShow ref
        pure ref
  liftAff $ delay $ Milliseconds 0.0
  go awaitRoute HomeR
  where go awaitRoute route = do
          route' <- awaitRoute <|> pickWidget route
          go awaitRoute route'


runApp :: forall a. UIWidget a -> Effect Unit
runApp = runWidgetInDom "app"

main :: Effect Unit
main = runApp app
