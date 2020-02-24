(import (cyclone test)
        (scheme base)
        (srfi 26))

(test-group "Tests from SRFI doc"
  (let ((a 9) (lis '(11 12)))
    (test
      "(cut cons (+ a 1) <>)" 
      ((cut cons (+ a 1) <>) lis)
      ((lambda (x2) (cons (+ a 1) x2)) lis)))
  (test
    "(cut list 1 <> 3 <> 5)"
    ((cut list 1 <> 3 <> 5) 2 4)
    ((lambda (x2 x4) (list 1 x2 3 x4 5)) 2 4))
  (test
    "(cut list)"
    ((cut list))
    ((lambda () (list))))
  (test
    "(cut list 1 <> 3 <...>)"
    ((cut list 1 <> 3 <...>) 2 4 5 6 7 8)
    ((lambda (x2 . xs) (apply list 1 x2 3 xs)) 2 4 5 6 7 8))
  (let ((a "test ") (b "done"))
    (test
      "(cut <> a b)"
      ((cut <> a b) string-append)
      ((lambda (f) (f a b)) string-append))) )

(test-exit)
