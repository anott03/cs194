module Main where

import LogAnalysis

main :: IO ()
main = do
    print $ LogAnalysis.parseMessage "I 6 message message"
    -- print $ takeUntilWhitespace "hello world"
