(defun cfx-get-cpu-load()
  "(cfx-get-cpu-load)
=>
((CPU3 4208 3626 1681 125829 15137 0 27 0 0 0)
 (CPU2 5344 3625 1840 125969 13760 0 30 0 0 0)
 (CPU1 8116 3520 1947 120724 16176 0 36 0 0 0)
 (CPU0 4514 2934 1960 102883 37532 0 71 0 0 0))"
  (let 
    (
      (in (open "/proc/stat" :if-does-not-exist nil))
      (value nil)
      (cpu-list nil)
    )
    (when in
      (loop for line = (read-line in nil) while line do 
        (setq value (read-from-string (concatenate 'string "(" line ")")) )
          (cond      
;            ((eq 'CPU  (car value)) (setq cpu-list (cons value cpu-list)))
            ((eq 'CPU0 (car value)) (setq cpu-list (cons value cpu-list)))
            ((eq 'CPU1 (car value)) (setq cpu-list (cons value cpu-list)))
            ((eq 'CPU2 (car value)) (setq cpu-list (cons value cpu-list)))
            ((eq 'CPU3 (car value)) (setq cpu-list (cons value cpu-list)))
            ((eq 'CPU4 (car value)) (setq cpu-list (cons value cpu-list)))
            ((eq 'CPU5 (car value)) (setq cpu-list (cons value cpu-list)))
            ((eq 'CPU6 (car value)) (setq cpu-list (cons value cpu-list)))))
      (close in))
    cpu-list))
    
(defun cfx-get-cpu()
  (let*
    ( 
      (time_1 (cfx-get-cpu-load))
      (time (sleep 1.0))
      (time_2 (cfx-get-cpu-load))
    )
    (mapcar (function cfx-core-load) time_2 time_1 )
  )
)
 
(defun cfx-core-load (cpu_2 cpu_1)
  (let
    (
      (core_name (car cpu_2))
      (core_3 (apply (function +)(mapcar (function -) (subseq cpu_2 1 4) (subseq cpu_1 1 4))))
      (core_4 (apply (function +)(mapcar (function -) (subseq cpu_2 1 5) (subseq cpu_1 1 5))))
    )
    (list core_name (float(/ (* 100 core_3) core_4)))
  )
) 
