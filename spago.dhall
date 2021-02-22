{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "concur-fomantic"
, dependencies =
  [ "arrays"
  , "concur-core"
  , "concur-react"
  , "console"
  , "effect"
  , "maybe"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
