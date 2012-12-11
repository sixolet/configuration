
(add-to-list 'load-path "~/configuration/elisp")

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . js-mode))
(add-hook 'js2-mode-hook
          (lambda ()
            (define-key js2-mode-map [mouse-1] nil)
            ))

(add-hook 'js-mode-hook
	  (lambda ()
	    (setq show-trailing-whitespace t
                 js-indent-level 2)))

(setq js-indent-level 2)
;spaces, not literal tabs
(setq-default indent-tabs-mode nil)
;no trailing whitespace
(setq-default show-trailing-whitespace t)
;maximum line length 80
(setq-default fill-column 80)

(show-paren-mode 1)

(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(iswitchb-mode t)
 '(js2-basic-offset 2)
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
