;; * Ruby mode

(my/ensure-package-installed 'robe)

(require 'ruby-mode)

(set 'ruby-insert-encoding-magic-comment nil)

;; ** Robe

(require 'robe)

(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

(defun my/ruby-send-region-or-line ()
  (interactive)
  (let ((region (my/line-at-position-or-region)))
    (ruby-send-region (car region) (car (cdr region)))))

(define-key robe-mode-map (kbd "C-x C-e") 'my/ruby-send-region-or-line)

;; ** Company

(eval-after-load 'company '(push 'company-robe company-backends))
