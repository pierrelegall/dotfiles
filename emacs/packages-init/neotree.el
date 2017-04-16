;; neotree

(my/ensure-package-installed 'neotree)

(require 'neotree)

(global-set-key [f8] 'neotree-toggle)
