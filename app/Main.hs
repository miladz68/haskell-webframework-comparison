module Main where

-- import Lib

import qualified SnapTest
import qualified YesodTest
import qualified ServantTest 
import qualified ScottyTest
import qualified SpockTest

main :: IO ()
main = ScottyTest.main 
-- main = SnapTest.main 
-- main = YesodTest.main 
-- main = SpockTest.main 
-- main = ServantTest.main 
