(require 'flycheck)

(global-flycheck-mode)

;; checkdoc is a bit intrusive for emacs lisp configs
(eval-after-load 'flycheck '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

(eval-after-load 'flycheck '(setq flycheck-checkers (delq 'php-phpmd flycheck-checkers)))
(eval-after-load 'flycheck '(setq flycheck-checkers (delq 'php-phpcs flycheck-checkers)))
(eval-after-load 'flycheck '(setq flycheck-checkers (delq 'scss flycheck-checkers)))

(add-hook 'js-mode-hook (lambda ()
                         (interactive)
                         (flycheck-mode -1)))

(setq flycheck-check-syntax-automatically '(save mode-enabled)
      flycheck-standard-error-navigation nil)

;; so flycheck can check (require calls properly.
(setq-default flycheck-emacs-lisp-load-path 'inherit)

(setq flycheck-highlighting-mode 'symbols)

(set-face-attribute 'flycheck-fringe-error nil
                    :background nil)

(set-face-attribute 'flycheck-fringe-warning nil
                    :background nil)


(set-face-attribute 'flycheck-error nil
                    :foreground nil
                    :background "darkred"
                    :underline nil)

(set-face-attribute 'flycheck-warning nil
                    :background nil
                    :foreground "orange"
                    :underline nil)

(provide 'setup-flycheck)
