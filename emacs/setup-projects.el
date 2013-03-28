(require 'eproject)

;;; Eproject definitions

;; Emacs config dir
(define-project-type emacs-init (generic)
  (look-for "init.el")
  :relevant-files ("\.el$" "\.md$" "snippets/")
  :irrelevant-files ("elpa/"))

;; Composer PHP Project
(define-project-type php-composer (generic)
  (look-for "composer.json")
  :irrelevant-files ("vendor/"))

(setq org-projects-dir "~/notes/projects")

(defun open-code-project ()
  "Choose the root directory of a code project and open eshell in the
root directory. Also open a repl and org-mode file if available."
  (interactive)
  (let ((project
		 (substring (read-directory-name "Project root:") 0 -1)))
	(if (get-buffer "*eshell*")
		(kill-buffer "*eshell*"))
	(while (not (elscreen-one-screen-p))
	  (elscreen-kill))
	(delete-other-windows)
	(switch-to-scratch-buffer)
	(cd project)
	(elscreen-create)
	(eshell)
	(split-window-right)
	(let ((org-file
		   (concat org-projects-dir "/"
				   (car (last (split-string project "/"))) ".org")))
	  (find-file org-file))
	))

(provide 'setup-projects)
