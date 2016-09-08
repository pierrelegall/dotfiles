;; * Org mode

;; ** Agenda

(setq org-agenda-files '("~/Documents/Tasks.org"))
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-list-sublevels nil)
(setq org-agenda-sorting-strategy
      '((agenda habit-down time-up priority-down category-keep)
        (todo todo-state-up priority-down category-keep)
        (tags priority-down category-keep)
        (search category-keep)))

;; ** Todo

(setq org-log-done t)
(setq org-todo-keywords '((sequence "STARTED(s)" "WAITING(w)"
                                    "TODO(t)" "MAYBE(m)"
                                    "|" "DONE(d)" "CANCELED(c)")))

;; ** Style

(require 'org-bullets)

(setq org-ellipsis " ...")

(setq org-src-fontify-natively t)

;; Babel

(require 'ob-tangle)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   ;;(cpp . t)
   (css . t)
   (ditaa . t)
   (dot . t)
   ;; (ebnf . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (haskell . t)
   (java . t)
   (js . t)
   (latex . t)
   (lisp . t)
   (makefile . t)
   (ocaml . t)
   (org . t)
   (perl . t)
   (plantuml . t)
   (python . t)
   (ruby . t)
   (sass . t)
   (scala . t)
   (scheme . t)
   (sql . t)))
   ;;(sed . t)
   ;;(shell . t))

;; ** Ditaa

(setq org-ditaa-jar-path "/usr/bin/ditaa")
(setq org-ditaa-jar-options "")

;; ** LaTeX

(setq org-latex-default-figure-position "H")

;; (setq org-latex-pdf-process
;;       '("pdflatex -interaction nonstopmode -output-directory %o %f"
;;         "bibtex $(basename %b)"
;;         "pdflatex -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-to-pdf-process (list "latexmk -pdf -bibtex %f"))

;; ** Maps

(let ((map my/global-map))
  (define-key map (kbd "C-c a") 'org-agenda)
  (define-key map (kbd "C-c l") 'org-store-link))

(let ((map org-mode-map))
  (define-key map (kbd "C-c i") 'outline-show-all)
  (define-key map (kbd "C-c h") 'outline-hide-sublevels)
  ;(define-key map (kbd "C-x p") 'org-promote-subtree)
  ;(define-key map (kbd "C-x d") 'org-demote-subtree)
  (define-key map (kbd "<prior>") 'org-move-subtree-up)
  (define-key map (kbd "<next>") 'org-move-subtree-down)
  (define-key map (kbd "C-c d") 'org-cut-subtree))

;; ** Hooks

(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)
