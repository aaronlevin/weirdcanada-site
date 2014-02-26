{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import           Web.Scotty                           (scotty, middleware)
import           Network.Wai.Middleware.RequestLogger

import           Controllers.Home                     (home)

main :: IO()
main = do
  scotty 3000 $ do
    middleware logStdoutDev
    home


