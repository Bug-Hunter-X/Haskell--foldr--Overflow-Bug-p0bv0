# Haskell `foldr` Overflow Bug

This repository demonstrates a subtle bug in Haskell code that uses the `foldr` function to sum a list of numbers.  The issue arises from the implicit type inference of the accumulator. When summing very large numbers, the `Integer` type can overflow, leading to incorrect results.

The `bug.hs` file contains the erroneous code. The `bugSolution.hs` file provides a corrected version using `Sum` for safer summation of large numbers.

## How to Reproduce

1. Clone this repository.
2. Run `bug.hs` with a large list of numbers. You will likely encounter unexpected results.
3. Run `bugSolution.hs` with the same large list to observe the corrected behaviour.

## Bug Explanation

The original code uses `foldr (+) 0`, relying on Haskell's type inference to determine the type of the accumulator. If the sum exceeds the maximum representable `Integer`, an overflow occurs. The `Sum` type avoids this by allowing for arbitrary-precision arithmetic.

## Solution

The solution uses the `Sum` newtype from the `Data.Monoid` module. This ensures that the summation is done with arbitrary precision, preventing the overflow error.