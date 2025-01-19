The solution involves using the `Sum` newtype from the `Data.Monoid` module, which provides a safer way to sum large numbers.

```haskell
import Data.Monoid

sumList :: [Integer] -> Integer
sumList xs = getSum (foldr (<>) mempty (map Sum xs))

main :: IO ()
main = print (sumList [1..1000000000000000000])
```
This solution leverages the `Monoid` instance for `Sum`, ensuring that the accumulation happens with arbitrary-precision arithmetic. The `getSum` function then extracts the final sum as an `Integer`.