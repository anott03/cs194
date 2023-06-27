{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where

import Log

parseMessageType :: String -> MessageType
parseMessageType s
    | take 1 s == "I" = Info
    | take 1 s == "W" = Warning
    | take 1 s == "E" = Error 0
    | otherwise = Error 0

parseTimeStamp :: String -> TimeStamp
parseTimeStamp _ = 0;

parseText :: String -> String
parseText s = s;

parseMessage :: String -> LogMessage
parseMessage s =
    LogMessage (parseMessageType s) (parseTimeStamp s) (parseText s)
