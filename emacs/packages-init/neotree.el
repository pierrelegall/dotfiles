;; neotree

(my/ensure-package-installed 'neotree)

(require 'neotree)

(setq neo-buffer--start-line nil)

(global-set-key [f8] 'neotree-toggle)
(global-set-key [S-f8] 'neotree-find)
