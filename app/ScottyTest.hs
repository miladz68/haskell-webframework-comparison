{-# LANGUAGE OverloadedStrings #-}

module ScottyTest where

import Web.Scotty

main = do
    putStrLn "Starting Server..."
    scotty 3000 $ get "/hello" $ do
            text "hello world!"
