{-# LANGUAGE OverloadedStrings #-}

module SnapTest(main) where

import      Snap
import      Snap.Core
import          Control.Applicative

main :: IO ()
main = quickHttpServe site

site :: Snap ()
site =
    ifTop (writeBS "hello world") <|>
    route [ ("foo", writeBS "bar")
          , ("echo/:echoparam", echoHandler)
          ] 

echoHandler :: Snap ()
echoHandler = do
    param <- getParam "echoparam"
    maybe (writeBS "must specify echo/param in URL")
          writeBS param
