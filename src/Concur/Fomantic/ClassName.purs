-- | css class操作
module Concur.Fomantic.ClassName ( UIClassName(..)
                                 ) where

import Prelude

data UIClassName = Primary
                 | Secondary
                 | Positive
                 | Negative
                 | Circle
                 | Inverted
                 | Basic
                 | Tertiary
                 | Active
                 | Disabled
                 | Loading
                 | Compact
                 | Mini
                 | Tiny
                 | Small
                 | Medium
                 | Large
                 | Big
                 | Huge
                 | Massive
                 | Red
                 | Orange
                 | Yellow
                 | Olive
                 | Green
                 | Teal
                 | Blue
                 | Violet
                 | Purple
                 | Pink
                 | Brown
                 | Grey
                 | Black
                 | RawClass String

instance elementStyleTypeShow :: Show UIClassName where
  show Primary = "primary"
  show Secondary = "secondary"
  show Positive = "positive"
  show Negative = "negative"
  show Circle = "Circle"
  show Inverted = "inverted"
  show Basic = "basic"
  show Tertiary = "Tertiary"
  show Active = "active"
  show Disabled = "disabled"
  show Loading = "loading"
  show Compact = "compact"
  show Mini = "mini"
  show Tiny = "tiny"
  show Small = "small"
  show Medium = "medium"
  show Large = "large"
  show Big = "big"
  show Huge = "huge"
  show Massive = "massive"
  show Red = "red"
  show Orange = "orange"
  show Yellow = "yellow"
  show Olive = "olive"
  show Green = "green"
  show Teal = "teal"
  show Blue = "blue"
  show Violet = "violet"
  show Purple = "purple"
  show Pink = "pink"
  show Brown = "brown"
  show Grey = "grey"
  show Black = "black"
  show (RawClass str) = str
