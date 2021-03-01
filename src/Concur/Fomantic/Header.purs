-- | 头部
module Concur.Fomantic.Header ( header1
                              , header2
                              , header3
                              , header4
                              , header5
                              , header
                              , headerWith
                              ) where

import Concur.Fomantic.ClassName (UIClassName(..))
import Concur.Fomantic.Internal.DOM (UIEl', wrapBaseEl', wrapEl')
import Concur.React.DOM as D

baseClass :: Array UIClassName
baseClass = [RawClass "ui header"]

header1 :: D.El'
header1 = wrapEl' D.h1 baseClass

header2 :: D.El'
header2 = wrapEl' D.h2 baseClass

header3 :: D.El'
header3 = wrapEl' D.h3 baseClass

header4 :: D.El'
header4 = wrapEl' D.h4 baseClass

header5 :: D.El'
header5 = wrapEl' D.h5 baseClass

header :: D.El'
header = wrapEl' D.div baseClass

headerWith :: UIEl'
headerWith = wrapBaseEl' D.div baseClass
