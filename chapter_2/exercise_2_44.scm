; #lang racket
;(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
#lang sicp
(#%require sicp-pict)

;; P90 - [练习 2.44, 图形语言]

(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))
            
;;;;;;;;;;;;;
(define wave einstein)
(paint (flipped-pairs wave))
(paint (right-split wave 3))
(paint (up-split wave 3))
(paint (corner-split wave 3))
