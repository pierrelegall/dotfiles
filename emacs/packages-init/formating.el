;; * Formating style

;; ** Saving hook

(add-hook 'write-file-hooks
          'delete-trailing-whitespace)

;; ** C

(setq c-default-style "linux")
(setq c-basic-offset 2)

;; ** Javascript

(setq js-indent-level 2)
