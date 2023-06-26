import Data.Ratio

-- credit card validating (exercises 1-4)
toDigits :: Integer -> [Integer]
toDigits x
    | x == 0 = []
    | otherwise = toDigits(x `div` 10) ++ [x `mod` 10]

toDigitsRev :: Integer -> [Integer]
toDigitsRev x = reverse $ toDigits x

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther (x:y:xs) = x : 2*y : doubleEveryOther xs
doubleEveryOther x = x

sumList :: [Integer] -> Integer
sumList x
    | null x = 0
    | otherwise = head x + sumList(tail x)

sumDigits :: [Integer] -> Integer
sumDigits x
    | null x = 0
    | otherwise = sumList(toDigits(head x)) + sumDigits(tail x)

validate :: Integer -> Bool
validate x = sumDigits(doubleEveryOther(toDigitsRev x)) `mod` 10 == 0

-- towers of hanoi (exercise 5)
type Peg = String
type Move = (Peg, Peg)
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi n src dst aux = hanoi (n-1) src aux dst ++ [(src, dst)] ++ hanoi (n-1) aux dst src

main = do
    print(validate 4012888888881881) -- should be true
    print(validate 4012888888881882) -- should be false
    print(hanoi 2 "a" "b" "c")
