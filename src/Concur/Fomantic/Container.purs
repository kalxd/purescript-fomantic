-- | 容器网格系统
module Concur.Fomantic.Container (container) where

import Concur.Fomantic.ClassName (UIClassName(..))
import Concur.Fomantic.DOM (div')
import Concur.React.DOM (El')

container :: El'
container = div' [RawClass "ui container"]
