;; goto-last-change

(my/ensure-package-installed 'goto-last-change)

(let ((map my/global-map))
  (define-key map (kbd "C-j") 'goto-last-change-with-auto-marks))
