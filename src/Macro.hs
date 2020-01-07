{-# LANGUAGE TemplateHaskell #-}

module Macro (decNewtype) where

import Language.Haskell.TH
import Language.Haskell.TH.Syntax

decNewtype :: Name -> Name -> Name -> Dec
decNewtype typeName dataName srcTypeName =
    NewtypeD [] typeName [] Nothing (NormalC dataName [(Bang NoSourceUnpackedness NoSourceStrictness,ConT srcTypeName)]) [DerivClause Nothing [ConT ''Show]]
