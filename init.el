
(require 'package)
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
   '("bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" default))
 '(package-selected-packages
   '(treemacs-projectile projectile doom-themes evil-commentary evil-visual-mark-mode treemacs evil elcord ample-theme ## which-key use-package)))
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

;; My own packages
(require 'elcord)
(require 'evil)

;; Loading my own configurations and packages
(elcord-mode)
(evil-mode 1)
