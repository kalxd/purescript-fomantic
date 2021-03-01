-- | Fomantic Segment.
module Concur.Fomantic.Segment ( segment
                               , segmentWith
                               ) where

import Concur.Fomantic.ClassName (UIClassName(..))
import Concur.Fomantic.Internal.DOM (UIEl, wrapBaseEl, wrapEl')
import Concur.React.DOM as D

baseClass :: Array UIClassName
baseClass = [RawClass "ui segment"]

segment :: D.El'
segment = wrapEl' D.div baseClass

segmentWith :: UIEl
segmentWith = wrapBaseEl D.div baseClass
