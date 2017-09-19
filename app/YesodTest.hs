
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
module YesodTest (main) where

import           Yesod
import           Data.ByteString
import           Data.Text (Text)

data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
|]

instance Yesod HelloWorld

-- getHomeR :: Handler Html
getHomeR = return $ object ["msg" .= ("Hello World"::Text)] 

main :: IO ()
main = warp 3000 HelloWorld
