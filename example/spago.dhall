{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
  [ "aff", "concur-react", "console", "effect", "psci-support", "routing" ]
, packages = ../packages.dhall
, sources = [ "src/**/*.purs" ]
}
