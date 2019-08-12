
module Learn where
  foo x =
    let y = x * 2
    in 2 * y

  main = putStrLn "hi"

  stringy :: String
  stringy = "asdf"

  waxOn = x * 5 where
    x = y^2
    y = z + 7
    z = 8

  triple x = x * 3
  

  waxOff x = triple x
  
  area d = pi * r^2
    where r = d / 2
