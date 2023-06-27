module Main where

import LogAnalysis

main :: IO ()
main = do
    print $ LogAnalysis.parseMessage "I 0 info message"
    print $ LogAnalysis.parseMessage "W 4 warning message"
    print $ LogAnalysis.parseMessage "E 6 7 error message"
