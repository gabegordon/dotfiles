;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Gabe Gordon"
      user-mail-address "ggordon@persistentsystems.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-material)
(setq doom-font (font-spec :family "Office Code Pro D" :size 18))
;;      doom-variable-pitch-font (font-spec :family "Source Sans 3" :size 18))


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
;;(use-package zoom
;;  :hook (doom-first-input . zoom-mode)
;;  :config
;;  (setq zoom-size '(0.7 . 0.7)
;;        zoom-ignored-major-modes '(dired-mode vterm-mode help-mode helpful-mode rxt-help-mode help-mode-menu org-mode)
;;        zoom-ignored-buffer-names '("*doom:scratch*" "*info*" "*helpful variable: argv*")
;;        zoom-ignored-buffer-name-regexps '("^\\*calc" "\\*helpful variable: .*\\*")
;;        zoom-ignore-predicates (list (lambda () (< (count-lines (point-min) (point-max)) 20)))))

(after! lsp-mode
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-lens-enable nil))
(after! lsp-ui
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-enable nil))

(windmove-default-keybindings)
(setq bm-cycle-all-buffers t)

(setq undo-limit 800000)
(setq undo-strong-limit 12000000)
(setq undo-outer-limit 120000000)
(after! magit
  (setq magit-gh-pulls-pull-detail-limit 200))
(setq vc-follow-symlinks t)

(defun er-switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(custom-set-variables
 '(helm-follow-mode-persistent t))

(define-key evil-normal-state-map (kbd "SPC TAB") 'er-switch-to-previous-buffer)
(define-key evil-normal-state-map (kbd "SPC c b") 'xref-pop-marker-stack)
(define-key evil-normal-state-map (kbd "SPC m g a") 'ff-get-other-file)
(define-key evil-normal-state-map (kbd "SPC m g g") 'xref-find-definitions)
(define-key evil-normal-state-map (kbd "SPC m g b") 'xref-pop-marker-stack)
(define-key evil-normal-state-map (kbd "SPC s a p") 'helm-projectile-ag)
(define-key evil-normal-state-map (kbd "SPC j i") 'helm-semantic-or-imenu)
(define-key doom-leader-open-map (kbd "r") 'helm-resume)

(setq eldoc-echo-area-display-truncation-message nil)
(setq eldoc-echo-area-use-multiline-p nil)
(setq-default evil-escape-key-sequence "fd")
(after! elgot
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) . ("clangd" "--header-insertion=never --header-insertion-decorators=0"))))

(after! helm
  (setq helm-completion-style 'helm-fuzzy)
  (setq helm-follow-mode-persistent t)
  (define-key helm-map (kbd "C-h") 'helm-find-files-up-one-level))
(run-at-time "5 min" 300 'recentf-save-list)
(add-hook 'prog-mode-hook #'(lambda ()
                             (message "running prog-mode-hook")
                             (dtrt-indent-mode)
                             (dtrt-indent-adapt)))
(require 'stickyfunc-enhance)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(semantic-mode 1)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)

(require 'dap-gdb-lldb)
(setq dap-auto-configure-mode t)
(require 'dap-cpptools)
