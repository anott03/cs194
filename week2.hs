-- enumeration types
data Thing = Thing1
           | Thing2
           | Thing3
           | Thing4
    deriving Show

t1 :: Thing
t1 = Thing1

thingList :: [Thing]
thingList = [Thing1, Thing2, Thing3, Thing4]

-- we can write functions on `Things` by pattern matching
isEven :: Thing -> Bool
isEven Thing1 = False
isEven Thing2 = True
isEven Thing3 = False
isEven Thing4 = True

-- enuemrations are a special case of Haskell's algebraic data types
-- example of a data type that is not just an enumeration:
data FailableDouble = Failure
                    | Ok Double
    deriving Show
-- this says that the `FailableDouble` has two data constructors... this
-- is basically a Rust `Option` where the Ok state is a Double
result :: FailableDouble
result = Ok 3.5

safeDiv :: Double -> Double -> FailableDouble
safeDiv _ 0 = Failure
safeDiv x y = Ok (x/y)

-- in general: an algebraic data type has one or more data constructors, each of
-- which can have zero or more arguments
-- ```
-- data AlgDataType = C1 Type1 Type2
--                  | C2 Type3 Type4
--                  | C3 Type5 Type6
-- ```

-- PATTERN MATCHING
-- fundamentally, pattern matching is about taking apart a value by finding out
-- which constructor it was built with
data Person = Person String Int Thing
    deriving Show
baz :: Person -> String
baz p@(Person n _ _) = "The name field of (" ++ show p ++ ") is " ++ n

checkFav :: Person -> String
checkFav (Person n _ Thing3) = n ++ ", you have a good favorite thing"
checkFav (Person n _ _) = n ++ ", you do not have a good favorite thing"

-- CASE EXPRESSIONS
failureToZero :: FailableDouble -> Double
failureToZero x = case x of
                    Failure -> 0
                    Ok d -> d

-- RECURSIVE DATA TYPES
data IntList = Empty | Cons Int IntList
intListProd :: IntList -> Int
intListProd Empty = 1
intListProd (Cons x l) = x * intListProd l

data Tree = Leaf Char
          | Node Tree Int Tree
    deriving Show

tree :: Tree
tree = Node (Leaf 'x') 1 (Node (Leaf 'y') 2 (Leaf 'z'))
