;; neotree

(my/ensure-package-installed 'neotree)

(require 'neotree)

(setq neo-show-updir-line nil)
(setq neo-window-fixed-size nil)

(global-set-key [f8] 'neotree-toggle)
(global-set-key [S-f8] 'neotree-find)
