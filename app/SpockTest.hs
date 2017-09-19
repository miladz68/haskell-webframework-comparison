{-# LANGUAGE OverloadedStrings #-}
module SpockTest (main) where


import Web.Spock
import Web.Spock.Config

-- import Control.Monad.Trans
-- import Data.Monoid
import Data.IORef
-- import qualified Data.Text as T

data MySession = EmptySession
data MyAppState = DummyAppState (IORef Int)

main :: IO ()
main =
    do ref <- newIORef 0
       spockCfg <- defaultSpockCfg EmptySession PCNoDatabase (DummyAppState ref)
       runSpock 8080 (spock spockCfg app)

app :: SpockM () MySession MyAppState ()
app = get root $ text "Hello World!"

