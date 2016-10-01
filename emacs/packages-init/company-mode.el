;; * Company mode

(my/ensure-package-installed 'company)

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

(define-key company-active-map (kbd "C-n") #'company-select-next)
(define-key company-active-map (kbd "C-p") #'company-select-previous)
