;; * Dired

(require 'dired)

(setq dired-listing-switches "--group-directories-first -Alh --indicator-style=slash")
(define-key dired-mode-map (kbd "C-m") 'dired-find-alternate-file)
