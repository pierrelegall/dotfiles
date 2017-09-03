;; ivy

(when nil

(my/ensure-package-installed 'ivy)
(my/ensure-package-installed 'swiper)
(my/ensure-package-installed 'counsel)
(my/ensure-package-installed 'counsel-projectile)
(my/ensure-package-installed 'smex)

(ivy-mode +1)
(counsel-mode +1)
(counsel-projectile-on)

(define-key isearch-mode-map (kbd "TAB") 'swiper-from-isearch)
;(define-key swiper-map (kbd "TAB") 'swiper-projectile-from-swiper)

(define-key swiper-map (kbd "C-r") 'ivy-previous-line)
(define-key swiper-map (kbd "C-s") 'ivy-next-line)
;(define-key swiper-projectile-map (kbd "C-r") 'ivy-previous-line)
;(define-key swiper-projectile-map (kbd "C-s") 'ivy-next-line)

(let ((map counsel-mode-map))
  (define-key map (kbd "C-c g g") 'counsel-git-grep))

)
