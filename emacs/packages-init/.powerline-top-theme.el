;; * Powerline top theme

;; ** Functions

(defun my/powerline-top-theme ()
  "Setup a powerline top theme mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval nil)))
  (setq-default header-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line nil) ;(if active 'mode-line 'mode-line-inactive))
                          (project-face (if active 'flycheck-error-list-id 'mode-line-inactve))
                          (buffer-face 'mode-line-buffer-id-inactive)
                          (left (list (if (or buffer-read-only (not buffer-file-name))
                                           (powerline-raw "     " mode-line)
                                         (if (buffer-modified-p)
                                             (powerline-raw " !!!  " project-face)
                                           (powerline-raw " --- " nil)))))
                          (center (if (buffer-file-name)
                                     (list (powerline-raw (projectile-project-name) project-face)
                                        (powerline-raw ": " mode-line)
                                        (powerline-raw (file-name-nondirectory (buffer-file-name)) project-face))
                                    (list (powerline-raw (buffer-name) project-face))))
                          (right (list (if (or buffer-read-only (not buffer-file-name))
                                           (powerline-raw "     " mode-line)
                                         (if (buffer-modified-p)
                                             (powerline-raw " !!!  " project-face)
                                           (powerline-raw " --- " nil))))))
                     (concat (powerline-render left)
                             (powerline-fill-center nil (/ (powerline-width center) 2.0))
                             (powerline-render center)
                             (powerline-fill nil (powerline-width right))
                             (powerline-render right))))))
  (my/hide-mode-line))

(defun my/hide-mode-line ()
  "Hide the mode line."
  (mapc (lambda (face)
          (set-face-attribute face nil :height 1))
        '(mode-line
          mode-line-buffer-id
          mode-line-emphasis
          mode-line-highlight
          mode-line-inactive)))
