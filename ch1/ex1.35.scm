#lang racket
(define tolerance 0.00001)
(define (close-enough? x y)
        (< (abs (- x y)) tolerance))

(define (fixed-point f first-guess)
        (define (try guess)
                (let ((next (f guess)))
                     (if (close-enough? guess next)
                         next
                         (try next))))
        (try first-guess))

(define golden-ratio (fixed-point (lambda (x) (+ 1 (/ 1 x))) 2.0))