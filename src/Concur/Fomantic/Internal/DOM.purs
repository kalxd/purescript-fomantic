-- | 创建通用组件。
module Concur.Fomantic.Internal.DOM where

import Prelude

import Concur.Core (Widget)
import Concur.Fomantic.ClassName (UIClassName)
import Concur.React (HTML)
import Concur.React.DOM as D
import Concur.React.Props (ReactProps, classList)
import Data.Array ((:))
import Data.Maybe (Maybe(..))

-- | 简写，反正以后都是这种形式。
type UIWidget = Widget HTML

type UIEl = Array UIClassName -> D.El

type UIEl' = Array UIClassName -> D.El'

type UILeaf = Array UIClassName -> D.ElLeaf

-- | 将UIClassName转化成React Prop。
mapClassName :: forall a. Array UIClassName -> ReactProps a
mapClassName = classList <<< map (Just <<< show)

-- | 包裹一层DOM，允许接受`UIClassName`。
wrapEl :: D.El -> UIEl
wrapEl el cl prop = el prop'
  where prop' = (mapClassName cl) : prop

-- | 包裹一层DOM，接受一组类，之后不再接受其他Props。
-- |
-- | 常用于容器类组件。
wrapEl' :: D.El -> UIEl'
wrapEl' el cl = el [prop]
  where prop = mapClassName cl

-- | 包裹基本组件，并允许拥有初始样式。
wrapBaseEl :: D.El -> Array UIClassName -> UIEl
wrapBaseEl el base cl = wrapEl el cl'
  where cl' = cl <> base

wrapLeaf :: D.ElLeaf -> UILeaf
wrapLeaf el cl props =  el props'
  where props' = (mapClassName cl) : props
