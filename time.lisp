;;;; time.lisp

(in-package :time)

;;; "time" goes here. Hacks and glory await!

(defun |YYYY-MM-dd_hh:mm:ss| (&optional (utime (get-universal-time)))
  "Функция печатает текущую дату и время операционной системы"
  (multiple-value-bind
	(s m h day month year)
      (decode-universal-time
       utime)
    (format nil "~4,'0d-~2,'0d-~2,'0d ~2,'0d:~2,'0d:~2,'0d" year month day h m s)))

(defun |hh:mm:ss| (&optional (utime (get-universal-time)))
  "Функция печатает текущуее время операционной системы"
    (multiple-value-bind
	(s m h day month year)
      (decode-universal-time
       utime)
      (format nil "~2,'0d:~2,'0d:~2,'0d" h m s)))

(defun |YYYY-MM-dd| ()
  "Функция печатает текущую дату операционной системы"
  (multiple-value-bind
	(s m h day month year)
      (decode-universal-time
       (get-universal-time))
    (format nil "~4,'0d-~2,'0d-~2,'0d" year month day )))

(defun double-local-time-to-utime (x)
    "Преобразует число типа double по местному времени 
в формат универсального времени (по Гринвичу)"
  (let* (
	 (lst (multiple-value-list
	       (decode-universal-time
		(* 24 60 60 (truncate (- x 2))) 0)))
	 (date    (fourth lst))
	 (month   (fifth lst))
	 (year    (sixth lst))
	 (hours   (second (multiple-value-list (truncate x))))
	 (hour    (truncate (* hours 24)))
	 (minutes (truncate (* 60 (- (* hours 24) hour))))
	 (second  (round (* 60 (- (* 60 (- (* hours 24) hour)) minutes)))))
    (encode-universal-time second minutes hour date month year)))

(defun utime-to-double-local-time (&optional (x (get-universal-time)))
  "Преобразует универсальное временя (по Гринвичу) 
в число типа double по местному времени"
  (multiple-value-bind (s m h dd mm yy) (decode-universal-time x)
    (+ 2d0
       (/ (encode-universal-time 0 0 0 dd mm yy 0) 24 60 60)
       (/ s 24 60 60)
       (/ m 24 60)
       (/ h 24))))
