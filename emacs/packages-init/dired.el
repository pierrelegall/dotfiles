;; * Dired

(require 'dired)

(setq dired-listing-switches "--group-directories-first -Alh --indicator-style=slash")
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-omit-files "^\\..*~?$")

;; ** Maps

(let ((map dired-mode-map))
  (define-key map (kbd "h") 'dired-omit-mode))

;; ** Hooks

(add-hook 'dired-mode-hook 'dired-omit-mode)
