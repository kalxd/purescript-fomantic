module Page.Route where

import Prelude

import Concur.Fomantic.Internal.DOM (UIWidget)
import Control.Alt ((<|>))
import Data.Foldable (oneOf)
import Effect.AVar as EV
import Effect.Aff (Milliseconds(..), delay)
import Effect.Aff.AVar as AV
import Effect.Aff.Class (liftAff)
import Effect.Class (liftEffect)
import Page.Button (buttonPage)
import Page.Home (homePage)
import Routing.Hash (matches)
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

watchRouteChange :: forall a. (UIWidget AppRoute -> UIWidget a) -> UIWidget a
watchRouteChange action = do
  routeRef <- liftEffect do
    var <- EV.empty
    void $ matches appRoute \_ route -> do
      void $ EV.tryPut route var
    pure var
  let awaitRoute = liftAff $ AV.take routeRef
  liftAff $ delay $ Milliseconds 0.0
  action awaitRoute

-- routeWidget :: forall a. UIWidget a
-- routeWidget = do
--   routeRef <- liftEffect do
--     var <- EV.empty
--     void $ matches appRoute \_ route -> do
--       void $ EV.tryPut route var
--     pure var
--   let awaitRoute = liftAff $ AV.take routeRef
--   liftAff $ delay $ Milliseconds 0.0
--   go awaitRoute HomeR
--   where go awaitRoute route = do
--           route' <- awaitRoute <|> pickWidget route
--           go awaitRoute route'

routeWidget :: forall a. UIWidget a
routeWidget = watchRouteChange \route -> do
  go route HomeR
  where go awaitRoute route = do
          route' <- awaitRoute <|> pickWidget route
          go awaitRoute route'
