module Page.Button where

import Concur.React.DOM as D
import Concur.Fomantic.Internal.DOM (UIWidget)

buttonPage :: forall a. UIWidget a
buttonPage = D.h1' [D.text "按钮集合"]
