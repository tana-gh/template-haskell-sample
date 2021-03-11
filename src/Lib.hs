module Lib (mkNewtype) where

import Macro
import System.IO
import Language.Haskell.TH
import Language.Haskell.TH.Syntax

mkNewtype :: Quasi m => FilePath -> m [Dec]
mkNewtype path = runQ $ do
    typeName : dataName : srcTypeName : _ <- runIO $ do
        content <- readFile path
        return $ map mkName $ words content
    return [decNewtype typeName dataName srcTypeName]
