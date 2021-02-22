-- | 一颗普通的按钮。
module Concur.Fomantic.Button where

import Concur.Fomantic.ClassName (UIClassName(..))
import Concur.Fomantic.Internal.DOM (UIEl, mkBaseEl, mkEl)
import Concur.React.DOM as D

button :: UIEl
button = mkEl D.button

uiButton :: UIEl
uiButton = mkBaseEl [RawClass "ui button"] D.button
