{-# LANGUAGE OverloadedStrings #-}

module Controllers.Home (
                        home
)	where

import           Web.Scotty                 (get)
import           Database.PostgreSQL.Simple (connect, query_)
import           Control.Monad.Reader       (ask)
import           Control.Monad.Trans        (liftIO)

import           Views.Home                 (homeView)
import           Types                      (WCM, liftScotty, dbConfig)

home :: WCM ()
home = do
    config <- ask
    conn <- liftIO . connect $ dbConfig config
    liftScotty $ get "/" homeView
