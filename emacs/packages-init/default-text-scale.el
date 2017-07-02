;; default-text-scale

(my/ensure-package-installed 'default-text-scale)

(require 'default-text-scale)

(global-set-key (kbd "C-M--") 'default-text-scale-decrease)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
