{-# LANGUAGE OverloadedStrings #-}

module Controllers.Home (
                        home
)	where

import Web.Scotty (ScottyM, ActionM, get)
import Views.Home (homeView)

home :: ScottyM ()
home = get "/" homeView
