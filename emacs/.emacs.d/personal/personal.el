;;; personal.el -- Josh's EMACS config
;;
;;; Commentary:
;;
;; My config for Emacs, using the prelude settings pack.
;;
;;; License:
;;
;;The MIT License (MIT)
;;
;;Copyright (c) 2019 Josh Comer
;;
;;Permission is hereby granted, free of charge, to any person obtaining a copy of
;;this software and associated documentation files (the "Software"), to deal in
;;the Software without restriction, including without limitation the rights to
;;use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
;;the Software, and to permit persons to whom the Software is furnished to do so,
;;subject to the following conditions:
;;
;;The above copyright notice and this permission notice shall be included in all
;;copies or substantial portions of the Software.
;;
;;THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
;;FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
;;COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
;;IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;;CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
;;
;;; Code:

(prelude-require-packages '(solarized-theme
                            use-package
                            paredit
                            clj-refactor
                            key-chord
                            avy
                            rainbow-delimiters
                            aggressive-indent
                            restclient
                            fennel-mode
                            company-restclient
                            org-roam))


(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("CHANGELOG\\.md\\'" . gfm-mode))

(eval-after-load 'clojure-mode
  '(progn
     (add-hook 'clojure-mode-hook
               (lambda ()
                 (smartparens-mode -1)
                 (paredit-mode 1)
                 (clj-refactor-mode 1)
                 (rainbow-delimiters-mode 1)
                 (aggressive-indent-mode 1)
                 (eldoc-mode 1)
                 (cljr-add-keybindings-with-prefix "C-c C-l")) t)))

(eval-after-load 'fennel-mode
  '(progn
     (add-hook 'fennel-mode-hook
               (lambda ()
                 (smartparens-mode -1)
                 (paredit-mode 1)
                 (aggressive-indent-mode 1)
                 (rainbow-delimiters-mode 1)
                 (eldoc-mode 1)))))

(eval-after-load 'cider
  '(progn
     (add-hook 'cider-repl-mode-hook #'paredit-mode)
     (add-hook 'cider-repl-mode-hook #'eldoc-mode)
     (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
     (setq cider-font-lock-dynamically '(macro core function var))
     (setq cider-overlays-use-font-lock t)
     (global-set-key (kbd "C-c C-s") #'cider-format-buffer)))

(eval-after-load 'company-mode
  '(progn
     (add-to-list 'company-backends 'company-restclient)))

(eval-after-load 'rust-mode
  '(progn
     (add-hook 'rust-mode-hook #'rainbow-delimiters-mode)))

(setq avy-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n))

;; For windows :S
;; (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")

;; Try just a visible bell
;;(setq visible-bell 1)
;; If that drives you crazy turn it all off
(setq ring-bell-function 'ignore)

;; Make tabs 4 spaces
(setq tab-width 4)

;; Set whitespace line length
(setq whitespace-line-column 120)

;;Turn off scrollbars
(scroll-bar-mode -1)

;;Make paredit look cool
(eval-after-load "paredit"
  '(diminish 'paredit-mode " π"))

;;Turn off guru mode
(setq guru-warn-only t)
;;(setq prelude-guru nil)

(disable-theme 'zenburn)

(setq solarized-use-more-italic t)

(load-theme 'solarized-dark t)

;;(aggressive-indent-global-mode 1)

(set-frame-font "Iosevka Slab-15" nil t)

;; Setup org-roam
(setq org-roam-directory "~/org-roam")
(add-hook 'after-init-hook 'org-roam-mode)

(provide 'personal)

;;; personal.el ends here
