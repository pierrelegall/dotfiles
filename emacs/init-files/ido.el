;; * Ido

(require 'ido)

(ido-mode t)
(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
                           "*Messages*" "Async Shell Command"))
