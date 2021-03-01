-- | 一颗普通的按钮。
module Concur.Fomantic.Button where

import Concur.Fomantic.ClassName (UIClassName(..))
import Concur.Fomantic.Internal.DOM (UIEl, wrapBaseEl, wrapEl)
import Concur.React.DOM as D

button :: UIEl
button = wrapEl D.button

uiButton :: UIEl
uiButton = wrapBaseEl D.button [RawClass "ui button"]
