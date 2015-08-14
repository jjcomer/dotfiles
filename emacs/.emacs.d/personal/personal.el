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
;;Copyright (c) 2013 Josh Comer
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
                            paredit
                            clj-refactor
                            key-chord
                            restclient))

(require 'clj-refactor)
(require 'key-chord)
(require 'paredit)
(require 'avy)
(require 'rainbow-delimiters)

(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(eval-after-load 'clojure-mode
  '(progn
     (add-hook 'clojure-mode-hook
               (lambda ()
                 (smartparens-mode -1)
                 (paredit-mode 1)
                 (clj-refactor-mode 1)
                 (rainbow-delimiters-mode 1)
                 (cljr-add-keybindings-with-prefix "C-c C-g")) t)))

(eval-after-load 'cider
  '(progn
     (add-hook 'cider-mode-hook 'paredit-mode)
     (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)))

(setq avy-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n))

(key-chord-define-global "xx" 'smex)

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
;;(setq guru-warn-only t)
(setq prelude-guru nil)

(disable-theme 'zenburn)

(setq solarized-use-more-italic t)

(load-theme 'solarized-dark t)

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2)
  (fact 2)
  (facts 2))

(provide 'personal)

;;; personal.el ends here
