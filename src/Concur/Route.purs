-- | Routing封装，实现一个更加好用的路由机制。

module Concur.Route (withRoute) where

import Prelude

import Concur.Fomantic.Widget (UIWidget)
import Control.Alt ((<|>))
import Effect.AVar as AVar
import Effect.Aff (Milliseconds(..), delay)
import Effect.Aff.AVar as Aff.AVar
import Effect.Aff.Class (liftAff)
import Effect.Class (liftEffect)
import Routing.Hash (matches)
import Routing.Match (Match)

-- | 监听路由变化，每次变化都会调用一次回调。
watchRouteChange :: forall a b. Match b -> (UIWidget b -> UIWidget a) -> UIWidget a
watchRouteChange route action = do
  routeRef <- liftEffect do
    var <- AVar.empty
    void $ matches route \_ route' -> do
      void $ AVar.tryPut route' var
    pure var
  let awaitRoute = liftAff $ Aff.AVar.take routeRef
  liftAff $ delay $ Milliseconds 0.0
  action awaitRoute

-- | 路由总线，使用该方法时，需要提供一些必要的参数。
-- | * 整体路由定义。
-- | * 默认路由名，用于显示默认页。
-- | * 绘制函数，路由匹配到时，调用该函数，绘制出界面。
-- | ```purescript
-- | data AppR = HomeR | NotFoundR
-- | appRoute = route *> oneOf [ end $> HomeR
-- |                           , lit "notfound" *> end $> NotFoundR
-- |                           ]
-- | drawApp :: forall a. AppR -> UIWidget a
-- | drawApp HomeR = text "home page"
-- | drawApp NotFoundR = text "not found"
-- |
-- | -- 调用它，自动监听路由变化，并调用`drawApp`绘制对应界面。
-- | appWidget :: forall a. UIWidget a.
-- | appWidget = withRoute appRoute HomeR drawApp
-- | ```
withRoute :: forall a b.
             Match b -- ^ 接受一个路由。
             -> b -- ^ 接受一个默认路由名。
             -> (b -> UIWidget b) -- ^ 根据路由名画出对应的界面。
             -> UIWidget a
withRoute route def draw = watchRouteChange route \route' -> do
  go route' def
  where go awaitRoute r = do
          r' <- awaitRoute <|> draw r
          go awaitRoute r'
