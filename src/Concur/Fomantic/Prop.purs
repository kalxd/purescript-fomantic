-- | 附加更多React Prop。
module Concur.Fomanti.Prop ( hashHref
                           , module Concur.React.Props
                           ) where

import Concur.React.Props

import Data.Function (($))
import Data.Semigroup ((<>))

-- | 对于hash route有奇效。
hashHref :: forall a. String -> ReactProps a
hashHref url = href $ "#" <> url
