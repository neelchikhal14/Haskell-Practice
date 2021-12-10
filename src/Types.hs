{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DeriveGeneric #-}


module Types (
    MetaData (..),
    Objects (..),
    Object (..),
    Extra (..),
    Person (..)
) where

import GHC.Generics
import Data.Text as T

data MetaData = MetaData
 {
     limit::Int,
     offset::Int,
     total_count::Int
 } deriving (Show,Generic)

data Objects = Objects
 {   
     metadata::MetaData,
     objects::[Object]
 } deriving (Show,Generic)

data Object = Object
 {
    caucus:: Maybe T.Text,
    congress_numbers::[Int],
    current:: Bool,
    description::T.Text,
    district:: Maybe T.Text,
    enddate::T.Text,
    extra::Extra,
    leadership_title::Maybe T.Text,
    party::T.Text,
    person::Person,
    role_type::T.Text,
    role_type_label::T.Text,
    senator_class::T.Text,
    senator_class_label::T.Text,
    senator_rank::T.Text,
    senator_rank_label::T.Text,
    startdate::T.Text,
    state::T.Text,
    title::T.Text,
    title_long::T.Text,
    website::T.Text
 } deriving (Show,Generic)


data Extra = Extra
 {
    address::T.Text,
    contact_form::T.Text,
    fax::Maybe T.Text,
    office::T.Text
 } deriving (Show,Generic)

data Person = Person
 {
    bioguideid::Text,
    birthday::T.Text,
    cspanid::Maybe Int,
    firstname::T.Text,
    gender::T.Text,
    gender_label::T.Text,
    lastname::T.Text,
    link::T.Text,
    middlename::T.Text,
    name::T.Text,
    namemod::T.Text,
    nickname::T.Text,
    osid::T.Text,
    pvsid:: Maybe T.Text,
    sortname::T.Text,
    twitterid::Maybe T.Text,
    youtubeid:: Maybe T.Text
 } deriving (Show,Generic)
