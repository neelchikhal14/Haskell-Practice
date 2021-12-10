{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE RecordWildCards #-}
module Parse (
  parseRecords
) where

import Types

import Data.Aeson (FromJSON (..),ToJSON (..), (.:))
import qualified Data.Aeson as AE
import GHC.Generics
import qualified Data.ByteString.Lazy.Char8 as L8
import Data.Char (toLower)

instance AE.FromJSON Objects where
  parseJSON = AE.withObject "Objects" $ \obj -> do
    metadata <- obj AE..: "meta"
    objects <- obj AE..: "objects"
    return $ Objects metadata objects

instance AE.FromJSON MetaData 
instance AE.FromJSON Object
instance AE.FromJSON Person 
instance AE.FromJSON Extra

parseRecords :: L8.ByteString -> Either String Objects
parseRecords json = AE.eitherDecode json :: Either String Objects