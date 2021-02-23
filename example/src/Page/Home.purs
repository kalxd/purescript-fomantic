module Page.Home where

import Concur.React.DOM as D
import Concur.Fomantic.Internal.DOM (UIWidget)

homePage :: forall a. UIWidget a
homePage = D.h1' [D.text "家"]
