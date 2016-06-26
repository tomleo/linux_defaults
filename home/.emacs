(setq-default indent-tabs-mode nil)

(tool-bar-mode 0) ;; Hide Toolbar
(menu-bar-mode 0) ;; Hide Menu
(scroll-bar-mode -1) ;; Hide Scrollbar

(require 'package) ;; You might already have this line


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                     ("elpy" . "https://jorgenschaefer.github.io/packages/")
                     ("marmalade" . "http://marmalade-repo.org/packages/")
                     ("melpa" . "http://melpa.org/packages/")))
(package-initialize)


;; via http://www.scriptscoop.net/t/be2f46b8ec4d/emacs-org-mode-evil-mode-tab-key-not-working.html
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)
(setq evil-want-visual-char-semi-exclusive t) ;; Fix selection to work like VIM

;; Select entire words that have underscores http://emacs.stackexchange.com/questions/9583/how-to-treat-underscore-as-part-of-the-word
(defadvice evil-inner-word (around underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))


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
      '((sequence "TODO" "|" "DONE")
        (sequence "HOLD" "TODO" "|" "DONE")))
(setq org-todo-keyword-faces
       '(("HOLD" . (:foreground "DarkGoldenrod3"))))
(eval-after-load "org"
  '(require 'ox-md nil t))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))


;; (setq org-publish-project-alist
;;       '(
;; 
;;    ("org-tom"
;;           ;; Path to your org files.
;;           :base-directory "/home/tom/hacking/org-jekyll-site/org/"
;;           :base-extension "org"
;; 
;;           ;; Path to your Jekyll project.
;;           :publishing-directory "/home/tom/hacking/org-jekyll-site/org/jekyll"
;;           :recursive t
;;           :publishing-function org-publish-org-to-html
;;           :headline-levels 4 
;;           :html-extension "html"
;;           :body-only t ;; Only export section between <body> </body>
;;     )
;; 
;; 
;;     ("org-static-tom"
;;           :base-directory "/home/tom/hacking/org-jekyll-site/org/"
;;           :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
;;           :publishing-directory "/home/tom/hacking/org-jekyll-site/"
;;           :recursive t
;;           :publishing-function org-publish-attachment)
;; 
;;     ("tom" :components ("org-tom" "org-static-tom"))
;; 
;; ))        




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

(define-key org-mode-map (kbd "C-j") nil)
(define-key org-mode-map (kbd "C-k") nil)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)

(require 'python-django)


;; (set-face-attribute 'default nil :font "-unknown-Input Mono-normal-r-normal-*-9-*-*-*-*-*-iso10646-1")

(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode highlight-parentheses-mode
  (lambda nil (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

; X Logical Font Description
; (find-font (font-spec :name font-name))
(require 'cl)
(defun font-candidate (&rest fonts)
    "Return existing font which first match."
    (find-if (lambda (f) (find-font (font-spec :name f))) fonts))
(font-candidate '"Input Mono-9:weight=normal")

(defun goto-def-or-rgrep ()
  "Go to definition of thing at point or do an rgrep in project if that fails"
  (interactive)
  (condition-case nil (elpy-goto-definition)
    (error (elpy-rgrep-symbol (thing-at-point 'symbol)))))

;; (define-key elpy-mode-map (kbd "M-.") 'goto-def-or-rgrep)
;; TODO: get this working again


(add-hook 'python-mode-hook (lambda () hs-minor-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-indent-style 4)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(global-evil-visualstar-mode)


(load-file "~/.emacs.d/ps-ccrypt.el")
(require 'ps-ccrypt "ps-ccrypt.el")



(setq org-log-into-drawer t)
(setq org-todo-keywords
      '((sequence "TODO(t!)" "HOLD(h@/!)" "|" "DONE(d!)" "|" "LOG(l!)")))


;; (defvar org-created-property-name "CREATED"
;;   "The name of the org-mode property that stores the creation date of the entry")
;; 
;; (defun org-set-created-property (&optional active NAME)
;;   "Set a property on the entry giving the creation time.
;; 
;; By default the property is called CREATED. If given the `NAME'
;; argument will be used instead. If the property already exists, it
;; will not be modified."
;;   (interactive)
;;   (let* ((created (or NAME org-created-property-name))
;;          (fmt (if active "<%s>" "[%s]"))
;;          (now  (format fmt (format-time-string "%Y-%m-%d %a %H:%M"))))
;;     (unless (org-entry-get (point) created nil)
;;       (org-set-property created now))))
;; 
;; (add-hook 'org-capture-before-finalize-hook #'org-set-created-property)


(require 'epa-file)
(epa-file-enable)


(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(require 'org-trello)


(custom-set-variables '(org-trello-files '("~/lists/tasks.org")))

;; (setq org-trello-consumer-key "179502231be7744ef4465838cf40f7de")
;; (setq org-trello-access-token "5fdb251a09074e5cdf0101df8e1d718b823f6eafd7e4f48cae3d861b8f81b9f3")

;; org-trello major mode for all .trello files
(add-to-list 'auto-mode-alist '("\\.trello$" . org-mode))

;; add a hook function to check if this is trello file, then activate the org-trello minor mode.
;;(Add-hook 'org-mode-hook
;;          (lambda ()
;;            (let ((filename (buffer-file-name (current-buffer))))
;;              (when (and filename (string= "trello" (file-name-extension filename)))
;;              (org-trello-mode)))))

(eval-after-load "haskell-mode"
    '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))
