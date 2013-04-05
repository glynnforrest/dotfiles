;; Autocomplete
(define-key ac-complete-mode-map (kbd "TAB") nil)
(define-key ac-complete-mode-map [tab] nil)
(define-key ac-mode-map (kbd "C-<return>" ) 'evil-ret)


;; Insert mode
(define-key evil-insert-state-map (kbd "C-a") 'beginning-of-line)
(define-key evil-insert-state-map (kbd "C-<down>") 'kill-this-buffer)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
(define-key evil-insert-state-map (kbd "C-?") 'evil-search-backward)
(define-key evil-insert-state-map (kbd "C-/") 'evil-search-forward)
(define-key evil-insert-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-insert-state-map (kbd "C-<left>") 'backward-word)
(define-key evil-insert-state-map (kbd "C-<right>") 'forward-word)
(define-key evil-insert-state-map (kbd "C-v") 'evil-paste-after)

;; Normal mode
(define-key evil-normal-state-map ",b" 'helm-buffers-list)
(define-key evil-normal-state-map ",B" 'kill-matching-buffers)
(define-key evil-normal-state-map ",C" 'cd)
(define-key evil-normal-state-map ",c" 'comment-or-uncomment-line)
(define-key evil-normal-state-map ",d" 'ido-dired)
(define-key evil-normal-state-map ",E" 'eval-and-replace-sexp)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-normal-state-map " " 'evil-ex)
(define-key evil-normal-state-map ",F" 'find-file)
(define-key evil-normal-state-map ",f" 'projectile-find-file)

;; Switch gj and j, gk and k
(define-key evil-normal-state-map "j" 'evil-next-visual-line)
(define-key evil-normal-state-map "k" 'evil-previous-visual-line)
(define-key evil-normal-state-map "gj" 'evil-next-line)
(define-key evil-normal-state-map "gk" 'evil-previous-line)

(define-key evil-normal-state-map ",g" 'magit-status)
(define-key evil-normal-state-map "gs" 'convert-to-end-of-sentence)
(define-key evil-normal-state-map ",I" 'my-save-and-eval-buffer)
(define-key evil-normal-state-map ",i" 'open-init-file)
(define-key evil-normal-state-map ",m" 'ace-jump-mode)
(define-key evil-normal-state-map ",N" 'narrow-to-defun)
(define-key evil-normal-state-map ",p" 'helm-show-kill-ring)
(define-key evil-normal-state-map ",q" 'multi-web-mode)
(define-key evil-normal-state-map ",r" 'recentf-ido-find-file)
(define-key evil-normal-state-map "]s" 'flyspell-goto-next-error)
(define-key evil-normal-state-map ",S" 'split-window-and-move-below)
(define-key evil-normal-state-map ",s" 'split-window-and-move-right)
(define-key evil-normal-state-map ",T" 'test-case-run-all)
(define-key evil-normal-state-map ",u" 'undo-tree-visualize)
(define-key evil-normal-state-map ",w" 'save-buffer)
(define-key evil-normal-state-map ",z" 'helm-imenu)
(define-key evil-normal-state-map "z=" 'ispell-word)

(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-<down>") 'kill-this-buffer)
(define-key evil-normal-state-map (kbd "C-S-a") 'evil-numbers/dec-at-pt)
(define-key evil-normal-state-map (kbd "C-S-h") 'evil-window-decrease-width)
(define-key evil-normal-state-map (kbd "C-S-j") 'evil-window-decrease-height)
(define-key evil-normal-state-map (kbd "C-S-k") 'evil-window-increase-height)
(define-key evil-normal-state-map (kbd "C-S-l") 'evil-window-increase-width)
(define-key evil-normal-state-map (kbd "<left>") 'previous-buffer)
(define-key evil-normal-state-map (kbd "M-j") 'move-line-down-and-indent)
(define-key evil-normal-state-map (kbd "M-k") 'move-line-up-and-indent)
(define-key evil-normal-state-map (kbd "<right>") 'next-buffer)

(define-key evil-normal-state-map ",T" 'try-code)
(define-key evil-normal-state-map (kbd "C-t") 'clever-rotate-text)
(define-key evil-normal-state-map (kbd "C-T") 'clever-rotate-text-backward)

;; Visual mode
(define-key evil-visual-state-map ",e" 'eval-region)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map " " 'evil-ex)
(define-key evil-visual-state-map "mb" 'evil-mc-edit-beginnings-of-lines)
(define-key evil-visual-state-map "me" 'evil-mc-edit-ends-of-lines)
(define-key evil-visual-state-map "mm" 'evil-mc-switch-to-cursors)
(define-key evil-visual-state-map ",n" 'narrow-to-region)


;; General mappings that should work in most modes
;; Windows
(define-key global-map (kbd "C-j") 'evil-window-down)
(define-key global-map (kbd "C-k") 'evil-window-up)
(define-key global-map (kbd "C-l") 'evil-window-right)
;; get help-map with f1 instead of C-h
(define-key global-map (kbd "C-h") 'evil-window-left)
(define-key global-map (kbd "C-<up>") 'delete-window)
(define-key global-map (kbd "C-S-<up>") 'delete-other-windows)
(define-key global-map (kbd "C-S-<down>") (lambda ()
											(interactive)
											(kill-this-buffer)
											(delete-window)))
(define-key global-map (kbd "M-q") 'quit-other-window)
;; Buffers
(define-key global-map (kbd "C-<left>") 'previous-buffer)
(define-key global-map (kbd "C-<right>") 'next-buffer)
(define-key help-mode-map (kbd "C-<down>") 'kill-this-buffer)
(define-key magit-mode-map (kbd "C-<down>") 'kill-this-buffer)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "<f5>" ) 'projectile-invalidate-cache)
(define-key global-map (kbd "<f9>") 'toggle-writeroom)
(define-key global-map (kbd "M-b") 'ido-switch-buffer)
(define-key global-map (kbd "M-B") 'previous-buffer)
(define-key global-map (kbd "<mouse-3>") nil)
(define-key global-map (kbd "M-/") 'switch-to-scratch-buffer)

;; Elscreen
(define-key global-map (kbd "M-<up>") 'elscreen-create)
(define-key global-map (kbd "M-<down>") 'elscreen-kill)
(define-key global-map (kbd "M-<left>") 'elscreen-previous)
(define-key global-map (kbd "M-<right>") 'elscreen-next)


;; Grep
(define-key grep-mode-map (kbd "<return>") 'grep-display-occurrence-recenter)
(define-key grep-mode-map (kbd "<S-return>") 'grep-goto-occurrence-recenter)

;; Magit
(define-key magit-mode-map (kbd "C-p") 'magit-push)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key occur-mode-map (kbd "<return>") 'occur-display-occurrence-recenter)
(define-key occur-mode-map (kbd "<S-return>") 'occur-goto-occurrence-recenter)
(define-key undo-tree-visualizer-map (kbd "C-<down>") 'kill-this-buffer)

(define-key global-map (kbd "C-c f") 'fix-double-capital)

(provide 'mappings)
