(use-package ivy :ensure t
  :config
  (ivy-mode t)

  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)

  (setq ivy-height 10)
  (setq ivy-count-format "")
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-re-builders-alist
	        '((t   . ivy--regex-ignore-order))))

(use-package counsel :ensure t)

(use-package swiper :ensure t)

(provide 'setup-ivy)
