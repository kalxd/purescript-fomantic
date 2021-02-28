module Main where

import Prelude

import Concur.Fomantic.Container (container)
import Concur.Fomantic.Internal.DOM (UIWidget)
import Concur.React.DOM as D
import Concur.React.Props (className, href)
import Concur.React.Run (runWidgetInDom)
import Control.Alt ((<|>))
import Effect (Effect)
import Page.Route (AppRoute(..), routeWidget, watchRouteChange)

topMenu :: forall a. AppRoute -> UIWidget a
topMenu route = D.nav [className "ui menu"] [body]
  where itemClass item = if route == (item :: AppRoute) then
                           className "active item"
                         else
                           className "item"
        body = container menus
        menus = [ D.a [itemClass HomeR, href "#/"] [D.text "首页"]
                , D.a [itemClass ButtonR, href "#/button"] [D.text "按钮"]
                ]

topMenuWidget :: forall a. UIWidget a
topMenuWidget = watchRouteChange \widget -> do
  go widget HomeR
  where go awaitWidget route = do
          route' <- awaitWidget <|> topMenu route
          go awaitWidget route'

runApp :: forall a. UIWidget a -> Effect Unit
runApp = runWidgetInDom "app"

appWidget :: forall a. UIWidget a
appWidget = D.div' [ topMenuWidget
                   , container [routeWidget]
                   ]

main :: Effect Unit
main = runApp appWidget
