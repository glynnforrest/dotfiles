(defun setup-elisp ()
  (eldoc-mode t)
  (paredit-mode t))

(add-hook 'emacs-lisp-mode-hook 'setup-elisp)
(add-hook 'lisp-interaction-mode-hook 'setup-elisp)
(add-hook 'ielm-mode-hook 'setup-elisp)

(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(defun lisp-describe-thing-at-point ()
  "Show the documentation of the Elisp function and variable near point.
   This checks in turn:
     -- for a function name where point is
     -- for a variable name where point is
     -- for a surrounding function call"
          (interactive)
          (let (sym)
            ;; sigh, function-at-point is too clever.  we want only the first half.
            (cond ((setq sym (ignore-errors
                               (with-syntax-table emacs-lisp-mode-syntax-table
                                 (save-excursion
                                   (or (not (zerop (skip-syntax-backward "_w")))
                                       (eq (char-syntax (char-after (point))) ?w)
                                       (eq (char-syntax (char-after (point))) ?_)
                                       (forward-sexp -1))
                                   (skip-chars-forward "`'")
                                   (let ((obj (read (current-buffer))))
                                     (and (symbolp obj) (fboundp obj) obj))))))
                   (describe-function sym))
                  ((setq sym (variable-at-point)) (describe-variable sym)))))

(define-key lisp-mode-shared-map (kbd "M-RET") 'lisp-describe-thing-at-point)
(define-key paredit-mode-map (kbd "M-q") 'close-help-buffer)

(provide 'setup-elisp)
