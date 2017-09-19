{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}

module ServantTest(main) where

import Servant.API
import Data.Proxy
import Control.Monad.Trans.Either
import Network.Wai.Handler.Warp
import Data.Aeson
import GHC.Generics
import Data.Text (Text)
import Network.HTTP.Media ((//), (/:))
import Network.Wai
import Network.Wai.Handler.Warp
import Servant


data User = User
  { hello :: Text 
  } deriving (Eq, Show, Generic)

instance ToJSON User


users1 :: User
users1 = User "world"   
  

type UserAPI1 = "users" :> Get '[JSON] User

server1 :: Server UserAPI1
server1 = return users1

userAPI :: Proxy UserAPI1
userAPI = Proxy

-- 'serve' comes from servant and hands you a WAI Application,
-- which you can think of as an "abstract" web application,
-- not yet a webserver.
app1 :: Application
app1 = serve userAPI server1

main :: IO ()
main = run 8081 app1
