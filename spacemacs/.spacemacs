(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path nil
   dotspacemacs-configuration-layers
   '(
     (auto-completion
      :variables
      auto-completion-tab-key-behavior 'cycle
      auto-completion-enable-help-tooltip t
      auto-completion-enable-sort-by-usage t
      :disabled-for org erc)
     (c-c++ :variables c-c++-backend 'lsp-ccls)
     emacs-lisp
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     git
     html
     javascript
     python
     lsp
     )
   dotspacemacs-additional-packages '(
                                      windmove
                                      evil-surround
                                      android-mode
                                      bm
                                      dtrt-indent
                                      vim-powerline
                                      term-cursor
                                      helm-lsp
                                      )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(
                                    )
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq comp-deferred-compilation t)
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 10
   dotspacemacs-check-for-update t
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'nil
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 5))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(material)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Office Code Pro D"
                               :size 19
                               :weight light
                               :width normal
                               :powerline-scale 1.)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab t
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text t
   dotspacemacs-ex-substitute-global t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 10
   dotspacemacs-helm-resize t
   dotspacemacs-helm-no-header t
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state t
   dotspacemacs-which-key-delay 1
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis t
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  (setq-default
   ;; Misc.
   vc-follow-symlinks t
   indent-tabs-mode t

   ;; Backups
   backup-directory-alist `((".*" . ,temporary-file-directory))
   auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
   backup-by-copying t
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   make-backup-files t

   ;; Magit
   magit-popup-show-common-commands nil
   magit-gh-pulls-pull-detail-limit 200
   magit-bury-buffer-function 'magit-mode-quit-window

   ;; Shell
   shell-default-term-shell "/bin/zsh"

   )
   (setq default-frame-alist '((font . "-NATH-Office Code Pro D-light-normal-normal-*-16-*-*-*-*-0-iso10646-1")))
  )

(defun dotspacemacs/user-config ()
  (add-hook 'prog-mode-hook #'(lambda ()
                                (message "running prog-mode-hook")
                                (dtrt-indent-mode)
                                (dtrt-indent-adapt)))

  ;; Fix helm search
  (defun kill-minibuffer ()
    (interactive)
    (when (windowp (active-minibuffer-window))
      (evil-ex-search-exit)))
  (add-hook 'mouse-leave-buffer-hook #'kill-minibuffer)
  (scroll-bar-mode -1)

  ;;(add-to-list 'spacemacs-indent-sensitive-modes 'c-mode)
  ;;(add-to-list 'spacemacs-indent-sensitive-modes 'c++-mode)

  (setq lsp-ui-doc-enable nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-signature-auto-activate nil) ;; you could manually request them via `lsp-signature-activate`
  (setq lsp-lens-enable nil)
  (setq native-comp-deferred-compilation t)

  ;; Settings
  (spacemacs/toggle-golden-ratio-on)
  (global-centered-cursor-mode +1)
  (set-default 'semantic-case-fold t)
  (global-set-key (kbd "<C-f2>") 'bm-toggle)
  (global-set-key (kbd "<f2>")   'bm-next)
  (global-set-key (kbd "<S-f2>") 'bm-previous)
  (setq bm-cycle-all-buffers t)
  (setq auto-window-vscroll nil)
  ;; default in spacemacs is 80000
  (setq undo-limit 800000)

  ;; default in spacemacs is 120000
  (setq undo-strong-limit 12000000)

  ;; default in spacemacs is 12000000
  (setq undo-outer-limit 120000000)

  ;; Windmove
  (windmove-default-keybindings)
  (add-hook 'org-shiftup-final-hook 'windmove-up)
  (add-hook 'org-shiftleft-final-hook 'windmove-left)
  (add-hook 'org-shiftdown-final-hook 'windmove-down)
  (add-hook 'org-shiftright-final-hook 'windmove-right)

  ;;Org
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/notes.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("s" "Code Snippet" entry(file+headline "~/org/notes.org" "Snippets")
           "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
          ("n" "Note" entry (file+headline "~/org/notes.org" "Notes")
           "* %?\t%^g\n%i\n")))
  (spacemacs/declare-prefix "o" "own-menu")
  ;; (spacemacs/set-leader-keys "oc" 'org-capture)
  ;; (spacemacs/set-leader-keys "oa" 'org-agenda)
  (spacemacs/set-leader-keys "or" 'helm-resume )

  ;; C-c C-j jump
  (setq org-goto-interface 'outline-path-completion
        org-goto-max-level 10)

  ;; Format Guessing
  (setq c-default-style "stroustrup")

  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)

  (semantic-mode 1)

  ;;(setf (lsp-session-folders-blacklist (lsp-session)) nil)
  ;;(lsp--persist-session (lsp-session))
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-idle-delay 1)
  (setq lsp-log-io nil) ; if set to true can cause a performance hit
  (setq evil-want-Y-yank-to-eol t)
  (setq helm-buffer-max-length 40)
  (setq lsp-enable-file-watchers nil)
  )
