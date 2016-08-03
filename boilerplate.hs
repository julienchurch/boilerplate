module Main where

import System.Environment ( 
                            getExecutablePath
                          , getArgs
                          )

import System.FilePath.Posix (joinPath, takeDirectory)
import System.Directory (getCurrentDirectory)

relBpDir :: FilePath
relBpDir = "lib/boilerplate.html"

boilerplate :: IO String
boilerplate = do
  execDir <- fmap takeDirectory getExecutablePath 
  bp <- readFile $ joinPath [execDir, relBpDir]
  return bp 

main :: IO ()
main = do
  bp <- boilerplate
  pwd <- getCurrentDirectory
  baseName <- getArgs 
  case baseName of
    [] -> putStrLn "Please try again with a filename as an argument."
    (x:xs) -> do
      let filePath = joinPath [pwd, x] 
      writeFile filePath bp


  
