;; ivy

(my/ensure-package-installed 'ivy)
(my/ensure-package-installed 'swiper)
(my/ensure-package-installed 'counsel)
(my/ensure-package-installed 'counsel-projectile)

(ivy-mode +1)
(counsel-mode +1)
(counsel-projectile-on)

(defun my/ivy--sort-by-length (_name candidates)
  "Alphanumeric sort for ivy results."
  (seq-sort 'string-lessp (seq-copy candidates)))

(setq ivy-re-builders-alist
      '((t . ivy--regex-ignore-order)))

(setq ivy-sort-matches-functions-alist
      '((ivy-switch-buffer . ivy-sort-function-buffer)
        (t . my/ivy--sort-by-length)))

(define-key isearch-mode-map (kbd "TAB") 'swiper-from-isearch)
;(define-key swiper-map (kbd "TAB") 'swiper-projectile-from-swiper)

(define-key swiper-map (kbd "C-r") 'ivy-previous-line)
(define-key swiper-map (kbd "C-s") 'ivy-next-line)
;(define-key swiper-projectile-map (kbd "C-r") 'ivy-previous-line)
;(define-key swiper-projectile-map (kbd "C-s") 'ivy-next-line)

(let ((map counsel-mode-map))
  (define-key map (kbd "C-c g g") 'counsel-git-grep))
