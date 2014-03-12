{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Types (
             WCConfig(..),
             WCM,
             liftScotty,
             toScotty
)	where


import           Web.Scotty                 (ScottyM)
import           Control.Monad.Trans        (lift)
import           Control.Monad.Reader.Class (MonadReader)
import           Control.Monad.IO.Class (MonadIO)
import           Control.Monad.Reader       (ReaderT, runReaderT)
import           Database.PostgreSQL.Simple (ConnectInfo(..))

data WCConfig = WCConfig { dbConfig :: ConnectInfo }

newtype WCM a = WCM { runWC :: ReaderT WCConfig ScottyM a }
               deriving (Monad, Functor, MonadReader WCConfig, MonadIO)

class Monad m => MonadScotty m where
  liftScotty :: ScottyM a -> m a

instance MonadScotty WCM where
  liftScotty = WCM . lift

toScotty :: WCConfig -> WCM a -> ScottyM a
toScotty c m = runReaderT (runWC m) c
