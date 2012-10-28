;; Org mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(mapcar (lambda (state)
          (evil-declare-key state org-mode-map
                            (kbd "M-l") 'org-metaright
                            (kbd "M-h") 'org-metaleft
                            (kbd "M-k") 'org-metaup
                            (kbd "M-j") 'org-metadown
                            (kbd "M-L") 'org-shiftmetaright
                            (kbd "M-H") 'org-shiftmetaleft
                            (kbd "M-K") 'org-shiftmetaup
                            (kbd "M-J") 'org-shiftmetadown))
        '(normal insert))

;;Notes are grouped by months for automatic archival.
;;At the start of every month move over notes that are still relevant.
(setq org-directory "~/Notes/")
(setq org-default-notes-file (concat org-directory "dates/" (downcase (format-time-string "%Y-%B.org"))))
(setq org-files (file-expand-wildcards (concat org-directory "*/*.org")))
(setq org-refile-targets
	  '((org-files :maxlevel . 1)
		(nil :maxlevel . 1)))
(setq org-agenda-files (list org-default-notes-file))

(defun find-file-in-org-directory ()
  "Find a file in `org-directory`. This function depends on the
`projectile` package."
  (interactive)
  (let* ((project-files (projectile-hashify-files
                         (projectile-get-project-files org-directory)))
         (file (ido-completing-read "File org file: "
                                    (loop for k being the hash-keys in project-files collect k))))
    (find-file (gethash file project-files))))

(define-key global-map (kbd "M-n") 'org-capture)
(define-key global-map (kbd "M-N") (lambda()
                                     (interactive)
                                     (find-file org-default-notes-file)
                                     ))
(define-key evil-normal-state-map (kbd "C-M-n") 'find-file-in-org-directory)
(evil-declare-key 'normal org-mode-map (kbd "C-t") 'org-todo)
(evil-declare-key 'insert org-mode-map (kbd "C-t") 'org-todo)
(evil-declare-key 'normal org-mode-map (kbd "C-m") 'org-refile)
(evil-declare-key 'visual org-mode-map (kbd "C-m") 'org-refile)
(evil-declare-key 'insert org-mode-map (kbd "M-<return>") (lambda()
                                                            (interactive)
                                                            (evil-append-line 1)
                                                            (org-meta-return)
                                                            ))
(evil-declare-key 'normal org-mode-map (kbd "M-<return>") (lambda()
                                                            (interactive)
                                                            (evil-append-line 1)
                                                            (org-meta-return)
                                                            ))
(evil-declare-key 'normal org-mode-map (kbd "<return>") 'org-open-at-point)
(define-key org-mode-map (kbd "C-S-<up>") 'delete-other-windows)

;; Vim style navigation
(define-key org-mode-map (kbd "C-c h") 'outline-up-heading)
(define-key org-mode-map (kbd "C-c j") 'outline-next-visible-heading)
(define-key org-mode-map (kbd "C-c k") 'outline-previous-visible-heading)
(define-key org-mode-map (kbd "C-c C-j") 'org-forward-same-level)
(define-key org-mode-map (kbd "C-c C-k") 'org-backward-same-level)

(setq org-todo-keywords
       '((sequence "TODO" "DONE" "WAITING")))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "#dc322f" :weight bold)
              ("DONE" :foreground "forest green" :weight bold :strike-through t)
              ("WAITING" :foreground "#89BDFF" :weight bold))))

(evil-declare-key 'normal org-mode-map "^" (lambda()
											 (interactive)
											 (beginning-of-line)
											 (evil-forward-word-begin)
											 (if (looking-at-p "TODO\\|DONE") (evil-forward-word-begin))
											 ))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Unsorted")
         "* TODO %?")
        ("l" "Linked Todo" entry (file+headline org-default-notes-file "Unsorted")
         "* TODO %?\n%a")
        ("n" "Note" entry (file+headline org-default-notes-file "Unsorted")
         "* %?")
        ("h" "Linked Note" entry (file+headline org-default-notes-file "Unsorted")
         "* %?\n%a")))

(provide 'init-org)
