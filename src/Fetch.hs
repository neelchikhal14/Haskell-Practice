{-# LANGUAGE OverloadedStrings #-}
module Fetch (
    download
) where


import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy as L

import Network.HTTP.Simple

import System.IO  
import System.IO.Error  
import Control.Exception

import qualified Data.ByteString.Lazy.Char8 as L8
import Network.HTTP.Simple


type URL = String

download :: URL -> IO L8.ByteString
download url = do
    request <- parseRequest url
    response <- httpLBS request
    let status = getResponseStatusCode response
    if status == 200
        then do
            print "saving Request To File"
            let jsonBody = getResponseBody response
            return jsonBody
    else
        if status == 301 
            then 
                -- print "Resource has been permanently moved to another location"
                error "Resource has been permanently moved to another location"
        else error ("Not Found Resource Missing . Status Code" ++ show(status))