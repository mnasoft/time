;;;; time.lisp

(in-package #:time)

;;; "time" goes here. Hacks and glory await!


(defun culc-time()
  (let (
	(start (multiple-value-list (get-time-of-day)))
	(end   (multiple-value-list (get-time-of-day)))
	)
    (setf
     start (multiple-value-list (get-time-of-day)))
    (dotimes (i 30000000 ) (multiple-value-list (get-time-of-day)))
    (setf
     end   (multiple-value-list (get-time-of-day)))
    (mapcar #'- end start)))

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

(defun encode-double-to-utime (x)
  (round (*
	  (-
	   (*	   
	    (- x 2.0d0)
	    24.0d0)
	   3.0d0)
	  60.0d0
	  60.0d0) 1))

(|YYYY-MM-dd_hh:mm:ss|
 (decode-double-to-utime 3.0d0))
;;;; (decode-double-to-utime 42117.804465d0))

(|YYYY-MM-dd_hh:mm:ss|)
(|hh:mm:ss|)
(|YYYY-MM-dd|)

(decode-universal-time 3638978306)


;;;;(culc-time)				

;;;;(- (encode-universal-time 0 0 0 1 1 1970 3) (encode-universal-time 0 0 0 1 1 1970 0))

;;;;(- (get-universal-time) (get-time-of-day) (encode-universal-time 0 0 0 1 1 1970 0))

;;;;(decode-universal-time (get-universal-time) )
