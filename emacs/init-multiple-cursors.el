;; This file adds support for evil mode in multiple cursors mode.

(require 'multiple-cursors)
(require 'mark-more-like-this)
(require 'evil)

(defun evil-mc-edit-beginnings-of-lines ()
  (interactive)
  (mc/edit-beginnings-of-lines)
  (evil-insert-state)
  (auto-complete-mode -1)
  )

(defun evil-mc-edit-ends-of-lines ()
  (interactive)
  (mc/edit-ends-of-lines)
  (evil-insert-state)
  (auto-complete-mode -1)
  )

(defun evil-mc-switch-to-cursors ()
  (interactive)
  (evil-insert-state)
  (auto-complete-mode -1)
  (mc/switch-from-mark-multiple-to-cursors)
  )

(defadvice mc/keyboard-quit (after mc-evil-cleanup activate)
  (interactive)
  (evil-normal-state)
  (auto-complete-mode t)
  )

(setq mc--cmds (append  mc--cmds '(
                                   evil-a-back-quote
                                   evil-a-bracket
                                   evil-a-curly
                                   evil-a-double-quote
                                   evil-align-center
                                   evil-align-left
                                   evil-align-right
                                   evil-an-angle
                                   evil-a-paragraph
                                   evil-a-paren
                                   evil-append
                                   evil-append-line
                                   evil-a-sentence
                                   evil-a-single-quote
                                   evil-a-tag
                                   evil-a-word
                                   evil-a-WORD
                                   evil-backward-char
                                   evil-backward-paragraph
                                   evil-backward-section-begin
                                   evil-backward-section-end
                                   evil-backward-sentence
                                   evil-backward-word-begin
                                   evil-backward-WORD-begin
                                   evil-backward-word-end
                                   evil-backward-WORD-end
                                   evil-beginning-of-line
                                   evil-beginning-of-line-or-digit-argument
                                   evil-beginning-of-visual-line
                                   evil-buffer
                                   evil-change
                                   evil-change-line
                                   evil-change-to-initial-state
                                   evil-change-to-previous-state
                                   evil-change-whole-line
                                   evil-close-fold
                                   evil-close-folds
                                   evil-complete-next
                                   evil-complete-next-line
                                   evil-complete-previous
                                   evil-complete-previous-line
                                   evil-copy-chars-from-line
                                   evil-copy-from-above
                                   evil-copy-from-below
                                   evil-delete
                                   evil-delete-backward-char
                                   evil-delete-backward-word
                                   evil-delete-buffer
                                   evil-delete-char
                                   evil-delete-line
                                   evil-delete-whole-line
                                   evil-digit-argument-or-evil-beginning-of-line
                                   evil-downcase
                                   evil-edit
                                   evil-emacs-state
                                   evil-end-of-line
                                   evil-end-of-visual-line
                                   evil-esc
                                   evil-esc-mode
                                   evil-ex
                                   evil-ex-delete-backward-char
                                   evil-execute-in-emacs-state
                                   evil-execute-in-normal-state
                                   evil-execute-macro
                                   evil-ex-global
                                   evil-ex-global-inverted
                                   evil-exit-emacs-state
                                   evil-exit-visual-state
                                   evil-ex-line-number
                                   evil-ex-nohighlight
                                   evil-ex-repeat
                                   evil-ex-repeat-global-substitute
                                   evil-ex-repeat-substitute
                                   evil-ex-repeat-substitute-with-flags
                                   evil-ex-repeat-substitute-with-search
                                   evil-ex-repeat-substitute-with-search-and-flags
                                   evil-ex-run-completion-at-point
                                   evil-ex-search-abort
                                   evil-ex-search-backward
                                   evil-ex-search-exit
                                   evil-ex-search-forward
                                   evil-ex-search-next
                                   evil-ex-search-previous
                                   evil-ex-search-symbol-backward
                                   evil-ex-search-symbol-forward
                                   evil-ex-search-unbounded-symbol-backward
                                   evil-ex-search-unbounded-symbol-forward
                                   evil-ex-set-initial-state
                                   evil-ex-substitute
                                   evil-fill
                                   evil-find-char
                                   evil-find-char-backward
                                   evil-find-char-to
                                   evil-find-char-to-backward
                                   evil-find-file-at-point-with-line
                                   evil-first-non-blank
                                   evil-first-non-blank-of-visual-line
                                   evil-force-normal-state
                                   evil-forward-char
                                   evil-forward-paragraph
                                   evil-forward-section-begin
                                   evil-forward-section-end
                                   evil-forward-sentence
                                   evil-forward-word-begin
                                   evil-forward-WORD-begin
                                   evil-forward-word-end
                                   evil-forward-WORD-end
                                   evil-goto-char
                                   evil-goto-column
                                   evil-goto-definition
                                   evil-goto-first-line
                                   evil-goto-line
                                   evil-goto-mark
                                   evil-goto-mark-line
                                   evil-insert
                                   evil-invert-char
                                   evil-indent
                                   evil-indent-line
                                   evil-inner-angle
                                   evil-inner-back-quote
                                   evil-inner-bracket
                                   evil-inner-curly
                                   evil-inner-double-quote
                                   evil-inner-paragraph
                                   evil-inner-paren
                                   evil-inner-sentence
                                   evil-inner-single-quote
                                   evil-inner-tag
                                   evil-inner-word
                                   evil-inner-WORD
                                   evil-insert
                                   evil-insert-digraph
                                   evil-insert-line
                                   evil-insert-resume
                                   evil-insert-state
                                   evil-invert-case
                                   evil-join
                                   evil-join-whitespace
                                   evil-jump-backward
                                   evil-jump-forward
                                   evil-jump-item
                                   evil-jump-to-tag
                                   evil-last-non-blank
                                   evil-line
                                   evil-local-mode
                                   evil-lookup
                                   evil-mode
                                   evil-motion-state
                                   evil-move-empty-lines
                                   evil-move-to-column
                                   evil-move-word
                                   evil-move-WORD
                                   evil-next-buffer
                                   evil-next-close-brace
                                   evil-next-close-paren
                                   evil-next-line
                                   evil-next-line-1-first-non-blank
                                   evil-next-line-first-non-blank
                                   evil-next-visual-line
                                   evil-normal-state
                                   evil-open-above
                                   evil-open-below
                                   evil-open-fold
                                   evil-open-folds
                                   evil-operator-shortcut-mode
                                   evil-operator-state
                                   evil-paste-after
                                   evil-paste-before
                                   evil-paste-from-register
                                   evil-paste-pop
                                   evil-paste-pop-next
                                   evil-prev-buffer
                                   evil-previous-line
                                   evil-previous-line-first-non-blank
                                   evil-previous-open-brace
                                   evil-previous-open-paren
                                   evil-previous-visual-line
                                   evil-record-macro
                                   evil-repeat
                                   evil-repeat-find-char
                                   evil-repeat-find-char-reverse
                                   evil-repeat-pop
                                   evil-repeat-pop-next
                                   evil-replace
                                   evil-replace-backspace
                                   evil-replace-state
                                   evil-ret
                                   evil-rot13
                                   evil-search-backward
                                   evil-search-forward
                                   evil-search-next
                                   evil-search-previous
                                   evil-search-symbol-backward
                                   evil-search-symbol-forward
                                   evil-set-marker
                                   evil-shell-command
                                   evil-shift-left
                                   evil-shift-right
                                   evil-show-buffers
                                   evil-show-file-info
                                   evil-show-registers
                                   evil-split-buffer
                                   evil-split-next-buffer
                                   evil-split-prev-buffer
                                   evil-substitute
                                   evil-toggle-fold
                                   evil-upcase
                                   evil-use-register
                                   evil-yank
                                   evil-yank-line
                                   )))

(provide 'init-multiple-cursors)
