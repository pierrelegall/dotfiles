;; * Org mode

;; ** Agenda

(setq org-agenda-files '("~/Documents/Organizer.org"))
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-list-sublevels nil)

;; ** Todo

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "STARTED(s)"
                                    "|" "DONE(d)" "CANCELED(c)")))

;; ** Map

(let ((map my/global-map))
  (define-key map (kbd "<M-up>") 'org-move-subtree-up)
  (define-key map (kbd "<M-down>") 'org-move-subtree-down))

;; ** Style

(require 'org-bullets)

(setq org-ellipsis " ...")

(setq org-src-fontify-natively t)

;; ** LaTeX

(setq org-latex-default-figure-position "H")

;; (setq org-latex-pdf-process
;;       '("pdflatex -interaction nonstopmode -output-directory %o %f"
;;         "bibtex $(basename %b)"
;;         "pdflatex -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-to-pdf-process (list "latexmk -pdf -bibtex %f"))

;; ** Hooks

(add-hook 'org-mode-hook
          (lambda ()
            (visual-line-mode)
            (org-indent-mode)))

(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode 1)))
