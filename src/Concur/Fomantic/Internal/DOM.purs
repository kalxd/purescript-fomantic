-- | 创建通用组件。
module Concur.Fomantic.Internal.DOM ( UIWidget
                                    , UIEl
                                    , UIEl'
                                    , mkEl
                                    , mkEl'
                                    , mkBaseEl
                                    ) where

import Prelude

import Concur.Core (Widget)
import Concur.Fomantic.ClassName (UIClassName)
import Concur.React (HTML)
import Concur.React.DOM (El, El')
import Concur.React.Props (ReactProps, classList)
import Data.Array ((:))
import Data.Maybe (Maybe(..))

-- | 简写，反正以后都是这种形式。
type UIWidget = Widget HTML

type UIEl = Array UIClassName -> El

type UIEl' = Array UIClassName -> El'

-- | 将UIClassName转化成React Prop。
mapClassName :: forall a. Array UIClassName -> ReactProps a
mapClassName = classList <<< map (Just <<< show)

-- | 创建UIEl组件。
mkEl :: El -> UIEl
mkEl el cl prop = el prop'
  where prop' = (mapClassName cl) : prop

mkEl' :: El -> UIEl'
mkEl' el cl = el [prop]
  where prop = mapClassName cl

-- | 创建带有基础样式的组件
mkBaseEl :: Array UIClassName -> El -> UIEl
mkBaseEl base el cl = mkEl el cl'
  where cl' = cl <> base
