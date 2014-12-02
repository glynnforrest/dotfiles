(require 'css-mode)

(setq css-indent-offset 2)

(defun cssEvilChangeToPX ()
  "Change text until `px` in css mode."
  (interactive)
  (if (looking-at-p " ")
      (evil-forward-word-begin))
  (let (( beg (point)))
    (evil-find-char 1 (string-to-char "p"))
    (evil-change beg (point))))

(evil-declare-key 'normal css-mode-map "gc" 'cssEvilChangeToPX)
(evil-declare-key 'normal css-mode-map ",e" 'skewer-css-eval-current-rule)

(require 'helm-css-scss)
(evil-declare-key 'normal css-mode-map ",a" 'helm-css-scss)
(evil-declare-key 'normal css-mode-map ",A" 'helm-css-scss-multi)

(require 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)


(provide 'setup-css)
