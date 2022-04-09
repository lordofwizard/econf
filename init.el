
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Packages my
(use-package which-key
  :ensure t
  :init
  (which-key-mode))
(require 'rust-mode)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#504545" "#ad8572" "#a9df90" "#aaca86" "#91a0b3" "#ab85a3" "#afcfef" "#bdbdb3"])
 '(custom-enabled-themes '(ample-flat))
 '(custom-safe-themes
   '("1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "c4063322b5011829f7fdd7509979b5823e8eea2abf1fe5572ec4b7af1dd78519" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" default))
 '(exwm-floating-border-color "#504945")
 '(fci-rule-color "#7c6f64")
 '(highlight-tail-colors ((("#363627" "#363627") . 0) (("#323730" "#323730") . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#0d1011" "#fabd2f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d1011" "#b8bb26"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d1011" "#928374"))
 '(objed-cursor-color "#fb4934")
 '(package-selected-packages
   '(rust-mode vterm-toggle vterm treemacs-projectile projectile doom-themes evil-commentary evil-visual-mark-mode treemacs evil elcord ample-theme ## which-key use-package))
 '(pdf-view-midnight-colors (cons "#ebdbb2" "#282828"))
 '(rustic-ansi-faces
   ["#282828" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#cc241d" "#8ec07c" "#ebdbb2"])
 '(treemacs-project-follow-mode t)
 '(vc-annotate-background "#282828")
 '(vc-annotate-color-map
   (list
    (cons 20 "#b8bb26")
    (cons 40 "#cebb29")
    (cons 60 "#e3bc2c")
    (cons 80 "#fabd2f")
    (cons 100 "#fba827")
    (cons 120 "#fc9420")
    (cons 140 "#fe8019")
    (cons 160 "#ed611a")
    (cons 180 "#dc421b")
    (cons 200 "#cc241d")
    (cons 220 "#db3024")
    (cons 240 "#eb3c2c")
    (cons 260 "#fb4934")
    (cons 280 "#e05744")
    (cons 300 "#c66554")
    (cons 320 "#ac7464")
    (cons 340 "#7c6f64")
    (cons 360 "#7c6f64")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "VictorMono" :family "Victor Mono")))))
(setq inhibit-startup-message t)


(defvar my-term-shell "/bin/fish")
(defadvice ansi-term (before force-fish)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;; for auto y or n
(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<s-return>") 'ansi-term)
(setq scroll-conservatively 100)
(global-display-line-numbers-mode)


;; FOR using some packages
(use-package treemacs
  :ensure t
  :bind
  (:map global-map
	([f6] . treemacs))
  :config
  (setq treemacs-is-never-other-window t))

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1)
  :init
  (when (file-directory-p "~/Documents/dev")
    (setq projectile-project-search-path '("~/Documents/dev")))
  (setq projectile-switch-project-action #'treemacs-projectile))
(setq projectile-project-search-path '("~/Documents/dev" "~/Documents/dev/c/ticc)"))

(use-package treemacs-projectile
:after (treemacs projectile)
:ensure t)
;; My own packages
(require 'elcord)
(require 'evil)

;; Loading my own configurations and packages
(elcord-mode)
(evil-mode 1)
(projectile-mode 1)
(rust-mode)
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))
