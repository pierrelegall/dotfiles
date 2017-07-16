;; neotree

(my/ensure-package-installed 'neotree)

(require 'neotree)

(global-set-key [f8] 'neotree-toggle)
(global-set-key [S-f8] 'neotree-find)
