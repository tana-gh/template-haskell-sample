{-# LANGUAGE TemplateHaskell #-}

module Main where

import Control.Monad.IO.Class
import Lib

mkNewtype "./data/type.txt"

main :: IO ()
main = print $ MyString "Hello, world!"
