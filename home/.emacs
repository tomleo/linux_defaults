(setq-default indent-tabs-mode nil)

(tool-bar-mode 0)
(menu-bar-mode 0)

(require 'package) ;; You might already have this line


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                     ("marmalade" . "http://marmalade-repo.org/packages/")
                     ("melpa" . "http://melpa.org/packages/")))
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)
(elpy-enable)

;; via http://www.scriptscoop.net/t/be2f46b8ec4d/emacs-org-mode-evil-mode-tab-key-not-working.html
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)
(setq evil-want-visual-char-semi-exclusive t) ;; Fix selection to work like VIM

(setq load-path (cons "~/.emacs.d/org-mode/lisp" load-path))
(setq load-path (cons "~/.emasc.d/org-mode/contrib/lisp" load-path))

;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'Org-iswitchb)
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files (list "~/lists/todo.org"))
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-todo-keywords
    '((sequence "TODO" "HOLD" "|" "DONE" "DELEGATED")))
(setq org-todo-keyword-faces
      '(("HOLD" . (:background "yellow" :foreground "black"))
        ("DELEGATED" . (:foreground "blue" :weight bold))))

(require 'flycheck)

(setq load-path (cons "~/.emacs.d/web-mode" load-path))
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))
(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."

  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (equal web-mode-content-type "jsx")
              ;; enable flycheck
              (flycheck-select-checker 'jsxhint-checker)
              (flycheck-mode))))


(define-key evil-motion-state-map ";" 'evil-ex)
(define-key evil-motion-state-map ":" 'evil-repeat-find-char)

(desktop-save-mode 1)


(add-to-list 'load-path "~/.emacs.d/twittering-mode")
(require 'twittering-mode)
(setq twittering-use-master-password t)


;(set-face-attribute 'default nil :font "DejaVu Sans Mono-9")
(set-face-attribute 'default nil :font "-unknown-Fira Mono-normal-normal-normal-*-9-*-*-*-m-0-iso10646-1")

(projectile-global-mode)
(require 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(add-to-list 'load-path "/home/tom/hacking/linux_defaults/home/.emacs.d/color-theme-wombat")
(load-theme 'wombat)

(setq ag-highlight-search t)
(setq projectile-switch-project-action 'helm-projectile-find-file)
(setq projectile-switch-project-action 'helm-projectile)

(require 'evil-magit)

(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
