{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Web.Scotty                           (scotty, middleware)
import           Network.Wai.Middleware.RequestLogger
import           Control.Monad.Reader                 (ask)
import           Network.Wai.Middleware.Static        (staticPolicy, addBase, noDots, (>->))
import           Database.PostgreSQL.Simple           (ConnectInfo(..), defaultConnectInfo, connect)

import           Controllers.Home                     (home)
import           Types                                (toScotty, WcConfig(..))


defaultConfig :: WcConfig
defaultConfig = WcConfig defaultConnectInfo {
                                     connectUser = "weirdcanada"
                                   , connectPassword = "weirdcanada"
                                   , connectDatabase = "weirdcanada"
                                   , connectHost = ""
                                   }


toScotty' = toScotty $ defaultConfig

main :: IO()
main = do
    scotty 3000 $ do
      middleware logStdoutDev
      middleware $ staticPolicy (noDots >-> addBase "public")
      toScotty' $ do
        home

