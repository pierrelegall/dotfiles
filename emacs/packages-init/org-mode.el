;; * Org mode

;; ** Agenda

(setq org-agenda-files '("~/Documents/Organizer.org"))
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-list-sublevels nil)

;; ** Todo

(setq org-todo-keywords '((sequence "TODO(t)" "MAYBE(m)" "WAITING(w)" "STARTED(s)"
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

;; Maps

(let ((map org-mode-map))
  (define-key map (kbd "<prior>") 'org-move-subtree-up)
  (define-key map (kbd "<next>") 'org-move-subtree-down))

;; ** Hooks

(add-hook 'org-mode-hook
          (lambda ()
            (visual-line-mode)
            (org-indent-mode)
            (org-bullets-mode)))
