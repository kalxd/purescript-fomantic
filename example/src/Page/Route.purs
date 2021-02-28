module Page.Route where

import Prelude

import Concur.Fomantic.Internal.DOM (UIWidget)
import Data.Foldable (oneOf)
import Page.Button (buttonPage)
import Page.Home (homePage)
import Routing.Match (Match, end, lit, root)

data AppRoute = HomeR
              | ButtonR

derive instance eqAppRoute :: Eq AppRoute

homeR :: Match AppRoute
homeR = end $> HomeR

buttonR :: Match AppRoute
buttonR = lit "button" *> end $> ButtonR

appRoute :: Match AppRoute
appRoute = root *> oneOf [homeR, buttonR]

pickWidget :: forall a. AppRoute -> UIWidget a
pickWidget HomeR = homePage
pickWidget ButtonR = buttonPage
