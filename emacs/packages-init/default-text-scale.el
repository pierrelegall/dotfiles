;; default-text-scale

(my/ensure-package-installed 'default-text-scale)

(require 'default-text-scale)

(setq default-text-scale-amount 12)

(global-set-key (kbd "C-M--") 'default-text-scale-decrease)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
