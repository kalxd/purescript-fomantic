-- | 创建通用组件。
module Concur.Fomantic.Internal.DOM ( UIWidget
                                    , UIEl
                                    , mkEl
                                    , mkBaseEl
                                    ) where

import Prelude

import Concur.Core (Widget)
import Concur.Fomantic.ClassName (UIClassName)
import Concur.React (HTML)
import Concur.React.DOM (El)
import Concur.React.Props (classList)
import Data.Array ((:))
import Data.Maybe (Maybe(..))

type UIWidget = Widget HTML

type UIEl = Array UIClassName -> El

-- | 创建UIEl组件。
mkEl :: El -> UIEl
mkEl el cl prop = el prop'
  where cl' = classList $ map (Just <<< show) cl
        prop' = cl':prop

-- | 创建带有基础样式的组件
mkBaseEl :: Array UIClassName -> El -> UIEl
mkBaseEl base el cl = mkEl el cl'
  where cl' = cl <> base
