{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Types (
             WcConfig(..),
             WcM,
             liftScotty,
             toScotty
)	where


import           Web.Scotty                 (ScottyM)
import           Control.Monad.Trans        (lift)
import           Control.Monad.Reader.Class (MonadReader)
import           Control.Monad.IO.Class (MonadIO)
import           Control.Monad.Reader       (ReaderT, runReaderT)
import           Database.PostgreSQL.Simple (ConnectInfo(..))

data WcConfig = WcConfig { dbConfig :: ConnectInfo }

newtype WcM a = WcM { runWc :: ReaderT WcConfig ScottyM a }
               deriving (Monad, Functor, MonadReader WcConfig, MonadIO)

class Monad m => MonadScotty m where
  liftScotty :: ScottyM a -> m a

instance MonadScotty WcM where
  liftScotty = WcM . lift

toScotty :: WcConfig -> WcM a -> ScottyM a
toScotty c m = runReaderT (runWc m) c
