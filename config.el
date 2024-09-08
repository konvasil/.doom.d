;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;; (setq doom-font (font-spec :family "Iosevka" :size 24 :weight 'regular)
;;      doom-variable-pitch-font (font-spec :family "SF Pro Text" :size 20))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'zaiste)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;;(add-to-list 'load-path "/Users/k.vasilakos/Downloads/org-re-reveal/")
;;(require 'org-re-reveal)


;; (use-package org-re-reveal
;;   :ensure t
;;   :config
;;   (setq org-re-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js@4.6.1/"
;; 	org-re-reveal-revealjs-version "4"
;; 	org-re-reveal-init-script (string-join '("hash: true"
;; 						 "hashOneBasedIndex: true"
;; 						 "respondToHashChanges: true"
;; 						 "fragmentInURL: true"
;; 						 "touch: true")
;; 					       ", ")
;; 	org-re-reveal-theme "moon"
;; 	org-re-reveal-title-slide 'auto
;; 	org-re-reveal-progress t
;; 	org-re-reveal-center   t
;; 	org-re-reveal-control  t
;; 	org-re-reveal-keyboard t
;; 	org-re-reveal-width  1400
;; 	org-re-reveal-height 1200))


(require 'simple-httpd)

(add-to-list 'load-path "/Users/k.vasilakos/Library/Application Support/SuperCollider/downloaded-quarks/scel/el")
(require 'sclang)

(setq exec-path (append exec-path '("/Applications/SuperCollider.app/Contents/MacOS/")))

(setq tidal-boot-script-path "/Users/k.vasilakos/.local/share/aarch64-osx-ghc-9.8.1/tidal-1.9.4/BootTidal.hs")

(setq tidal-interpreter "/Users/k.vasilakos/.ghcup/bin/ghci")

(org-roam-db-autosync-mode)
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
    :custom (org-roam--directory "~/org-roam")
;;  :hook (after-init . org-roam-ui-mode)
    :bind (("C-c n l" . org-roam-buffer-toggle)
           ("C-c n f" . org-roam-node-find)
           ("C-c n i" . org-roam-node-insert))
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
 ;;(set-frame-parameter (selected-frame) 'alpha <both>)
;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(75 100))
(add-to-list 'default-frame-alist '(alpha 85 85))
(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(85 . 50) '(100 . 100)))))

(global-set-key (kbd "C-c C-t") 'toggle-transparency)

(add-to-list 'load-path "/opt/homebrew/bin/gnuplot")
