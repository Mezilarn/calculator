module Main (main) where

main :: IO ()
main = do
  putStrLn "Enter the first number:"
  firstStr <- getLine
  putStrLn "Enter the operator:"
  operator <- getLine
  putStrLn "Enter the second number:"
  secondStr <- getLine
  let firstNumber = read firstStr::Double
  let secondNumber = read secondStr::Double
  calculate firstNumber operator secondNumber

calculate :: Double -> String -> Double -> IO ()
calculate firstNumber operator secondNumber = do
  if operator == "+"
    then print (firstNumber + secondNumber)
    else if operator == "-"
      then print (firstNumber - secondNumber) 
      else if operator == "*"
        then print (firstNumber * secondNumber)
        else if operator == "/"
          then print (firstNumber / secondNumber)
          else putStrLn "Incorrect operator entered"