module Lib (mkNewtype) where

import Macro
import Paths_template_haskell_sample
import System.IO
import Language.Haskell.TH
import Language.Haskell.TH.Syntax

mkNewtype :: Quasi m => FilePath -> m [Dec]
mkNewtype path = runQ $ do
    typeName : dataName : srcTypeName : _ <- runIO $ do
        dataDir <- getDataDir
        content <- readFile path
        return $ map mkName $ words content
    return [decNewtype typeName dataName srcTypeName]
