{-# LANGUAGE OverloadedStrings #-}

module Views.Home (
                  homeView
)	where

import           Text.Blaze.Html5
import           Text.Blaze.Html5.Attributes
import           Views.Index       (layout)
import           Views.Util        (blaze)
import           Web.Scotty        (ActionM)
import qualified Text.Blaze.Html5              as H
import qualified Text.Blaze.Html5.Attributes   as A

homeView :: ActionM ()
homeView = blaze $ layout "home" $ do
             H.div ! class_ "container" $ do
               H.h2 "Weirdcanada !!!!"
