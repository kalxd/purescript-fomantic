module Main where

import Prelude

import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as D
import Concur.React.Props as P
import Concur.React.Run (runWidgetInDom)
import Data.Foldable (oneOf)
import Effect (Effect)
import Effect.Aff (Milliseconds(..), delay, launchAff_)
import Effect.Class.Console (logShow)
import Routing.Hash (matches)
import Routing.Match (Match, root, lit, end)

-- | 我们的全局路由
data AppR = HomeR
          | ButtonR
          | NotFoundR

instance showAppR :: Show AppR where
  show HomeR = "Home R"
  show ButtonR = " Button R"
  show NotFoundR = "NotFound R"

homeR :: Match AppR
homeR =  HomeR <$ end

buttonR :: Match AppR
buttonR = lit "button" $> ButtonR <* end

router :: Match AppR
router = root *> lit "" *> oneOf [ buttonR
                       , homeR
                       , pure NotFoundR
                       ]

homePage :: forall a. Widget HTML a
homePage = D.div [P.className "ui container"] [D.text "hello"]

buttonPage :: forall a. Widget HTML a
buttonPage = D.div [P.className "ui container"] [button]
  where button = D.button [P.className "ui primary button"] [D.text "hello"]

notFoundPage :: forall a. Widget HTML a
notFoundPage = D.h1 [] [D.text "什么都没有"]

routerForPage :: forall a. AppR -> Widget HTML a
routerForPage HomeR = homePage
routerForPage ButtonR = buttonPage
routerForPage NotFoundR = notFoundPage

runApp :: forall a. Widget HTML a -> Effect Unit
runApp = runWidgetInDom "app"

main :: Effect Unit
main = do
  launchAff_ do
    delay $ Milliseconds 0.0
  join $ matches router \a router' -> do
    logShow a
    logShow router'
    let app = routerForPage router'
    runApp app
