module Main where

import Prelude

import Concur.Fomantic.Container (container)
import Concur.Fomantic.Internal.DOM (UIWidget)
import Concur.React.DOM as D
import Concur.React.Props (className, href)
import Concur.React.Run (runWidgetInDom)
import Effect (Effect)
import Page.Route (routeWidget)

topMenu :: forall a. UIWidget a
topMenu = D.nav [className "ui menu"] [body]
  where body = container menus
        menus = [ D.a [className "item", href "#/"] [D.text "首页"]
                , D.a [className "item", href "#/button"] [D.text "按钮"]
                ]

runApp :: forall a. UIWidget a -> Effect Unit
runApp = runWidgetInDom "app"

appWidget :: forall a. UIWidget a
appWidget = D.div' [ topMenu
                   , container [routeWidget]
                   ]

main :: Effect Unit
main = runApp appWidget
