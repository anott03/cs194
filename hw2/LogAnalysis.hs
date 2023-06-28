{-# OPTIONS_GHC -Wall #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module LogAnalysis where

import Log
import Data.Bifunctor

takeUntil :: [Char] -> Char-> ([Char], [Char])
takeUntil (h:t) c
    | null (h:t) = ("", t)
    | h == ' ' = ("", t)
    | otherwise = (h : fst(takeUntil t c), snd $ takeUntil t c)

parseMessageType :: [Char] -> (MessageType, [Char])
parseMessageType (x:_:xs)
    | x == 'I' = (Info, xs)
    | x == 'W' = (Warning, xs)
    | x == 'E' = (Error (read (fst $ takeUntil xs ' ') :: Int), snd $ takeUntil xs ' ')

parseTimeStamp :: [Char] -> (TimeStamp, [Char])
parseTimeStamp s = first read (takeUntil s ' ')

parseText :: [Char] -> [Char]
parseText s = s;

parseMessage :: [Char] -> LogMessage
parseMessage s =
     uncurry
     (LogMessage (fst $ parseMessageType s))
     (parseTimeStamp $ snd $ parseMessageType s)
