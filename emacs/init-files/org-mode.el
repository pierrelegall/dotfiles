;; * Org mode

;; ** Agenda

(setq org-agenda-files '("~/Documents/Organizer/"))
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-list-sublevels nil)

;; ** Todo

(setq org-todo-keywords '((sequence "TODO(t)" "|" "DONE(d)")))

;; ** Map

(let ((map my-global-map))
  (define-key map (kbd "<M-up>") 'org-move-subtree-up)
  (define-key map (kbd "<M-down>") 'org-move-subtree-down))

;; ** LaTeX

;; (setq org-latex-pdf-process
;;       '("pdflatex -interaction nonstopmode -output-directory %o %f"
;;         "bibtex $(basename %b)"
;;         "pdflatex -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-to-pdf-process (list "latexmk -pdf -bibtex %f"))
