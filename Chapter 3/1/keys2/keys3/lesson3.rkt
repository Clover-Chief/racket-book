#lang racket 
(define (sum n)
    (if (= 0 n) 0
        (+ n (sum (- n 1)))))
(define (sum2 n)
  (define (s n acc)
    (if (= 0 n) acc
        (s (- n 1) (+ acc n))))
  (s n 0))
(define (sum3 n)
(let loop ([n n] [acc 0])
(if (= 0 n) acc
(loop (- n 1) (+ acc n)))))
(define (sum4 n)
(let ([s 0]) ; initialize s to zero
(do () ; an optional initializer statement can go here
((< n 1)) ; do until this becomes true
(set! s (+ s n))
(set! n (- n 1)))
  s))
(define (sum5 n)
  (let ([s 0])
    (do ([ i 1 (add1 i)]) ; initialize i=1, set i = i+1 at each iteration
      ((> i n) s)
      (set! s (+ s i)))))
(define digits (in-range 10))
(stream-first digits)
(stream-first (stream-rest digits))
(stream-ref digits 5)
(define naturals (in-naturals))
(stream-first naturals)
(stream-first (stream-rest naturals))
(stream-ref naturals 1000)
(let* ([h "Hello"]
       [l (string-length h)])
  (for ([i (in-range 1)])
    (display (string-ref h i))
    (newline)))
(for ([i 5]) (display i))
(for ([c "Hello"])
  (display c)
  (newline))
(define (list-chars str)
  (for ([c str]
        [i (in-naturals)])
    (printf "~a: ~a\n" i c)))
(list-chars "Hello")
> (for* ([i (in-range 2 7 4)]
[j (in-range 1 4)])
(display (list i j (* i j)))
(newline))
(for/list ([x (in-naturals)] #:break (> x 10)) (sqr x))
(for/list ([x (in-range 11)]) (sqr x))
(for/list ([x (in-range 11)] #:when (even? x)) (sqr x))
(for ([n (in-range 1 10)] #:unless (= n 5))
  (printf "~a ~a\n" n (sqr n)))
(for/and ([x  '(2 4 6)]) (even? x))
(for/and ([x '(2 4 5 6)]) (even? x))
(for/and ([x '(2 4 5 6)]
[y #(3 5 9 8)])
(< x y))
 (for/and ([x '(2 6 5 6)]
[y #(3 5 9 8)])
(< x y))
(for/or ([x '(2 7 4 6)]) (> x 5))
(for/or ([x '(2 1 4 5)]) (> x 5))
(for/first ([x '(2 1 4 6 7 1)] #:when (> x 5)) x)
(for/first ([x '(2 1 4 5 2)] #:when (> x 5)) x)
(for/first ([x '(2 1 4 5 2)] #:when (> x 5)) x)
(for/last ([x '(2 1 4 6 7 1)] #:when (> x 5)) x)
(for/sum ([i (in-range 1 11)]) (sqr i))
(for/product ([i (in-range 1 11)]) (sqr i))
(define (make-comp bal int)
(let ([rate (add1 (/ int 100.0))])
 (λ () (set! bal (* bal rate)) (round bal))))
(define bal (make-comp 100 4))
(bal)
(bal)
(bal)
(bal)
(define (fact1 n)
  (if ( = 0 n) 1
      (* n (fact1 (- n 1)))))

(define fact
(let ([h (make-hash)]) ; hash table to contain memoized values
 (define (fact n)
   (cond [(= n 0) 1]
         [(hash-has-key? h n) (hash-ref h n)]
         [else
          (let ([f (* n (fact (- n 1)))])
            (hash-set! h n f)
            f)]))
 fact))

(define q ('tom 'dick 'harry))
(car q)
(set! q (cdr q))
q
(set! q (append q (list 'sue)))
q
