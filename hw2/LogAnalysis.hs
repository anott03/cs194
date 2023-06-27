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

parseMessageType :: [Char] -> MessageType
parseMessageType (x:xs)
    | x == 'I' = Info
    | x == 'W' = Warning
    | x == 'E' = Error (read (fst $ takeUntilWhitespace xs) :: Int)
    | otherwise = Error 0

parseTimeStamp :: [Char] -> (TimeStamp, [Char])
parseTimeStamp s = first read (takeUntilWhitespace s)

parseText :: [Char] -> [Char]
parseText s = s;

parseMessage :: [Char] -> LogMessage
parseMessage s =
    LogMessage (parseMessageType $ fst $ takeUntilWhitespace s)
