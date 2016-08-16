(add-to-list 'load-path "~/configuration/elisp")
(add-to-list 'load-path "~/configuration/elisp/coffee-mode")
(when (>= emacs-major-version 24) 
      (add-to-list 'load-path "~/configuration/elisp/go-mode")
      (add-to-list 'load-path "~/configuration/elisp/company-mode")
      (add-to-list 'load-path "~/configuration/gocode/emacs-company"))

(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/gopath/bin")

(setenv "GOPATH" "~/gopath")

;; Pulled from http://paralambda.org/2012/07/02/using-gnu-emacs-as-a-terminal-emulator/
(when (require 'multi-term nil t)
  (global-set-key (kbd "<f5>") 'multi-term)
  (global-set-key (kbd "<C-next>") 'multi-term-next)
  (global-set-key (kbd "<C-prior>") 'multi-term-prev)
  (setq multi-term-buffer-name "term"
        multi-term-program "/bin/bash"))
(when (require 'term nil t) ; only if term can be loaded..
  (setq term-bind-key-alist
        (list (cons "C-c C-c" 'term-interrupt-subjob)
              (cons "C-p" 'previous-line)
              (cons "C-n" 'next-line)
              (cons "M-f" 'term-send-forward-word)
              (cons "M-b" 'term-send-backward-word)
              (cons "C-c C-j" 'term-line-mode)
              (cons "C-c C-k" 'term-char-mode)
              (cons "M-DEL" 'term-send-backward-kill-word)
              (cons "M-d" 'term-send-forward-kill-word)
              (cons "<C-left>" 'term-send-backward-word)
              (cons "<C-right>" 'term-send-forward-word)
              (cons "C-r" 'term-send-reverse-search-history)
              (cons "M-p" 'term-send-raw-meta)
              (cons "M-y" 'term-send-raw-meta)
              (cons "C-y" 'term-send-raw))))

(setq-default indent-tabs-mode nil)

;; The following is my own or pulled from random places.
(add-hook 'term-mode-hook (lambda ()
  (setq show-trailing-whitespace nil)))

(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

;; go mode setup
(when (>= emacs-major-version 24)
  (require 'go-mode-load)
  (defun my-go-mode-hook ()
    (setq-local tab-width 4)
    (setq-local company-backends '(company-go))
    (company-mode)
    (if
        ;; the go-server repository uses a nonstandard gofmt -- four-space indent
        (string-match-p "go-server" (buffer-file-name))
        (progn
          (setq-local indent-tabs-mode nil)
          (setq-local gofmt-command "~/configuration/gofmt-spaces.sh"))))
  
  (add-hook 'go-mode-hook 'my-go-mode-hook)
  (add-hook 'before-save-hook #'gofmt-before-save)

  (require 'company)
  (require 'company-go)
)

;; coffeescript mode setup
(when (>= emacs-major-version 24)
  (require 'coffee-mode)
  (custom-set-variables '(coffee-tab-width 2)))

;; python mode setup

(add-hook 'python-mode-hook (lambda ()
  (setq indent-tabs-mode nil)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
;; js2-mode setup
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . js-mode))
(add-hook 'js2-mode-hook
          (lambda ()
            (define-key js2-mode-map [mouse-1] nil)
            ))

(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq show-trailing-whitespace t
                 js-indent-level 2)))

(add-hook 'js2-mode-hook (lambda ()
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(setq js-indent-level 2)
;spaces, not literal tabs
(setq-default indent-tabs-mode nil)
;no trailing whitespace
(setq-default show-trailing-whitespace t)
;maximum line length 80
(setq-default fill-column 80)

(show-paren-mode 1)

(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

(defun create-tags-js (dir-name)
     "Create tags file."
     (interactive "DDirectory: ")
     (eshell-command
      (format "find %s -type f -name \"*.js\" -not -path \"*/.*/*\"| etags -" dir-name)))


;;smerge-mode
(eval-after-load "smerge-mode"
  '(progn
     (setq smerge-base-re "^|||||||.*\n")))

(defun sm-try-smerge ()
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward "^<<<<<<< " nil t)
      (smerge-mode 1))))
(add-hook 'find-file-hook 'sm-try-smerge t)



(defalias 'yes-or-no-p 'y-or-n-p)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(iswitchb-mode t)
 '(js2-basic-offset 2)
 '(js2-global-externs (quote ("Meteor" "_" "Accounts" "Tinytest" "console" "process" "LocalCollection" "Spark" "EJSON")))
 '(js2-include-browser-externs nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "Monaco"))))
 '(cursor ((t (:background "MediumPurple4"))))
 '(font-lock-comment-face ((t (:foreground "medium slate blue"))))
 '(font-lock-keyword-face ((t (:foreground "dark blue" :weight bold))))
 '(font-lock-string-face ((t (:foreground "sea green"))))
 '(font-lock-variable-name-face ((t (:foreground "dark green"))))
 '(js2-external-variable ((t (:foreground "magenta4"))))
 '(js2-function-param ((t (:foreground "dark green"))))
 '(region ((t (:background "selectedTextBackgroundColor")))))
