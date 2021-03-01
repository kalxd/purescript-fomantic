{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "concur-fomantic"
, dependencies =
  [ "arrays"
  , "avar"
  , "concur-core"
  , "concur-react"
  , "console"
  , "effect"
  , "foldable-traversable"
  , "maybe"
  , "psci-support"
  , "routing"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
