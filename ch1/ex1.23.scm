#lang racket
(define (runtime) (current-milliseconds))

(define (square x) (* x x))

(define (divides? a b)
        (=  (remainder b a) 0))

(define (next test-divisor)
        (if (= test-divisor 2) 3 (+ test-divisor 2)))

(define (find-divisor n test-divisor)
        (cond ((> (square test-divisor) n) n)
              ((divides? test-divisor n) test-divisor)
              (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
        (find-divisor n 2))

(define (prime? n)
        (= (smallest-divisor n) n))

(define (timed-prime-test n)
        (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
        (when (prime? n) (report-time n (- (runtime) start-time))))

(define (report-time n elapsed-time)
        (newline)
        (display n)
        (display " *** ")
        (display elapsed-time))

(define (search-for-primes a b)
        (timed-prime-test a)
        (when (< a b) (search-for-primes (+ a 2) b)))

(search-for-primes 1000000001 1000000021)       
(search-for-primes 10000000001 10000000061)     
(search-for-primes 100000000001 100000000057)   
(search-for-primes 1000000000001 1000000000063)

;1000000007 *** 4      1000000007 *** 2
;1000000009 *** 3      1000000009 *** 2
;1000000021 *** 3      1000000021 *** 2
;10000000019 *** 10    10000000019 *** 6
;10000000033 *** 9     10000000033 *** 5
;10000000061 *** 9     10000000061 *** 6
;100000000003 *** 30   100000000003 *** 17
;100000000019 *** 29   100000000019 *** 18
;100000000057 *** 29   100000000057 *** 17
;1000000000039 *** 102 1000000000039 *** 56
;1000000000061 *** 92  1000000000061 *** 55
;1000000000063 *** 91  1000000000063 *** 55