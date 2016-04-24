;; * Behavior

(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default message-log-max nil)
(delete-selection-mode 1)
(show-paren-mode 1)
(global-visual-line-mode 1)
(global-auto-complete-mode)
(setq shift-select-mode nil)
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

