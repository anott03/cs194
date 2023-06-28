module Main where

import LogAnalysis

exec :: String -> IO ()
exec s
    | s == "" = do
        print ""
    | otherwise = do
        print $ LogAnalysis.parseMessage $ fst $ takeUntil s '\n'
        exec $ snd $ takeUntil s '\n'

main :: IO ()
main = do  
    contents <- getContents
    exec contents
