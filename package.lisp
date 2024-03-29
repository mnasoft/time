;;;; package.lisp

(defpackage :time
  (:use #:cl)
  (:export |YYYY-MM-dd_hh:mm:ss|)        ; Функция печатает текущую дату и время операционной системы
  (:export |hh:mm:ss|)                   ; Функция печатает текущуее время операционной системы
  (:export |YYYY-MM-dd|)                 ; Функция печатает текущую дату операционной системы
  (:export double-local-time-to-utime)   ; Преобразует число типа double по местному времени в формат универсального времени (по Гринвичу)
  (:export utime-to-double-local-time)   ; Преобразует универсальное временя (по Гринвичу) в число типа double по местному времени
  )

;;;;(declaim (optimize (space 0) (compilation-speed 0)  (speed 0) (safety 3) (debug 3)))

;;;; (declaim (optimize (compilation-speed 0) (debug 3) (safety 0) (space 0) (speed 0)))
