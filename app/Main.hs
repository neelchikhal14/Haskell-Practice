{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import Prelude
import Control.Monad
import Data.Aeson (FromJSON(..),ToJSON(..),(.:))
import qualified Data.Aeson as JSON
import Types
import Parse
import qualified GHC.List as LL
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as LC
import Network.HTTP.Simple

import Fetch (download)
import System.IO  
import System.IO.Error  
import Control.Exception
import GHC.Generics
import qualified Data.ByteString.Lazy.Char8 as L8
import Data.Text as T




main :: IO ()
main = do
    let url = "https://www.govtrack.us/api/v2/role?current=true&role_type=senator"
    print "Downloading..."
    json <- download url
    print json
    print "Parsing..."
    let eitherUser = parseRecords json
    case eitherUser of
        Left msg   -> putStrLn("error: " ++ msg)
        Right user -> putStrLn("user: " ++ show user)
            


