module Main where

import Prelude

import Concur.Fomanti.Prop (hashHref)
import Concur.Fomantic.ClassName (UIClassName(..))
import Concur.Fomantic.Container (container)
import Concur.Fomantic.Internal.DOM (UIWidget)
import Concur.Fomantic.Segment (segmentWith)
import Concur.React.DOM as D
import Concur.React.Props (className)
import Concur.React.Run (runWidgetInDom)
import Concur.Route (withRoute)
import Effect (Effect)
import Page.Route (AppRoute(..), appRoute, pickWidget)

watchRoute :: forall a. (AppRoute -> UIWidget AppRoute) -> UIWidget a
watchRoute = withRoute appRoute HomeR

topMenu :: forall a. AppRoute -> UIWidget a
topMenu route = D.nav [className "ui menu"] [body]
  where itemClass item = if route == (item :: AppRoute) then
                           className "active item"
                         else
                           className "item"
        body = container menus
        menus = [ D.a [itemClass HomeR, hashHref "/"] [D.text "首页"]
                , D.a [itemClass ButtonR, hashHref "/button"] [D.text "按钮"]
                ]

topMenuWidget :: forall a. UIWidget a
topMenuWidget = watchRoute topMenu

runApp :: forall a. UIWidget a -> Effect Unit
runApp = runWidgetInDom "app"

appWidget :: forall a. UIWidget a
appWidget = D.div' [ topMenuWidget
                   , container [segmentWith [Teal] [watchRoute pickWidget]]
                   ]

main :: Effect Unit
main = runApp appWidget
