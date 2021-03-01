-- | 重新封装过的原始组件。
module Concur.Fomantic.DOM where

import Concur.Fomantic.Internal.DOM (UIEl, UIEl', UILeaf, wrapEl, wrapEl', wrapLeaf)
import Concur.React.DOM as D

button :: UIEl
button = wrapEl D.button

button' :: UIEl'
button' = wrapEl' D.button

div :: UIEl
div = wrapEl D.div

div' :: UIEl'
div' = wrapEl' D.div

input :: UILeaf
input = wrapLeaf D.input
