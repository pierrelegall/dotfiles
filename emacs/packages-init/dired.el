;; * Dired

(require 'dired)

(setq dired-listing-switches "--group-directories-first -Alh --indicator-style=slash")
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-omit-files "^\\..*~?$")

;; ** Maps

(let ((map dired-mode-map))
  (define-key map (kbd "h") 'dired-omit-mode)
  (define-key map (kbd "P") 'dired-up-directory)
  (define-key map (kbd "b") 'dired-up-directory))

;; ** Hooks

(add-hook 'dired-mode-hook 'dired-omit-mode)
