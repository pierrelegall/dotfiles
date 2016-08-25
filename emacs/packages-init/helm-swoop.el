;; * Helm swoop

(require 'helm-swoop)

;; ** Maps

(define-key isearch-mode-map (kbd "TAB") 'helm-swoop-from-isearch)
(define-key helm-swoop-map (kbd "TAB") 'helm-multi-swoop-all-from-helm-swoop)

(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
(define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)
