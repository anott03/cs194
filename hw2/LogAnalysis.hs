{-# OPTIONS_GHC -Wall #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module LogAnalysis where

import Log
import Data.Bifunctor

takeUntilWhitespace:: [Char] -> ([Char], [Char])
takeUntilWhitespace (h:t)
    | null (h:t) = ("", t)
    | h == ' ' = ("", t)
    | otherwise = (h : fst(takeUntilWhitespace t), snd $ takeUntilWhitespace t)

parseMessageType :: [Char] -> (MessageType, [Char])
parseMessageType (x:_:xs)
    | x == 'I' = (Info, xs)
    | x == 'W' = (Warning, xs)
    | x == 'E' = (Error (read (fst $ takeUntilWhitespace xs) :: Int), snd $ takeUntilWhitespace xs)

parseTimeStamp :: [Char] -> (TimeStamp, [Char])
parseTimeStamp s = first read (takeUntilWhitespace s)

parseText :: [Char] -> [Char]
parseText s = s;

parseMessage :: [Char] -> LogMessage
parseMessage s =
     uncurry
     (LogMessage (fst $ parseMessageType s))
     (parseTimeStamp $ snd $ parseMessageType s)
