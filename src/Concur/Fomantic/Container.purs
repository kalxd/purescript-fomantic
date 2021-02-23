-- | 容器网格系统
module Concur.Fomantic.Container (container) where

import Concur.Fomantic.ClassName (UIClassName(..))
import Concur.Fomantic.Internal.DOM (mkEl')
import Concur.React.DOM (El')
import Concur.React.DOM as D

container :: El'
container = mkEl' D.div [RawClass "ui container"]
