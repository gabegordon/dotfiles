(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path nil
   dotspacemacs-configuration-layers
   '(
     (auto-completion
      :variables
      auto-completion-enable-snippets-in-popup t
      auto-completion-tab-key-behavior 'cycle
      auto-completion-enable-help-tooltip t
      auto-completion-enable-sort-by-usage t
      :disabled-for org erc)
     c-c++
     csv
     emacs-lisp
     erc
     extra-langs
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     git
     github
     haskell
     html
     javascript
     (latex :variables latex-enable-auto-fill t)
     markdown
     org
     pdf-tools
     python
     (ranger :variables ranger-override-dired t)
     (semantic :disabled-for emacs-lisp)
     (shell :variables shell-default-shell 'eshell)
     (spell-checking :variables spell-checking-enable-by-default nil)
     syntax-checking
     (version-control :variables version-control-diff-tool 'diff-hl)
     yaml
     )
   dotspacemacs-additional-packages '(
                                      windmove
                                      function-args
                                      irony
                                      company-irony
                                      company-irony-c-headers
                                      flycheck-irony
                                      helm-flycheck
                                      evil-surround
                                      )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(tern)
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
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
   dotspacemacs-default-font '("Source Code Pro"
                               :size 22
                               :weight normal
                               :width normal
                               :powerline-scale 1.15)
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
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers 'relative
   dotspacemacs-folding-method 'origami
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis t
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  (setq-default
   ;; Misc.
   vc-follow-symlinks t
   indent-tabs-mode nil
   org-format-latex-options (plist-put org-format-latex-options :scale 6.0)

   ;; Backups
   backup-directory-alist `((".*" . ,temporary-file-directory))
   auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
   backup-by-copying t
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   make-backup-files nil

   ;; Documentation
   spacemacs-space-doc-modificators
   '(org-indent-mode
     alternative-tags-look
     link-protocol
     org-kbd-face-remap
     resize-inline-images)

   ;; Magit
   magit-popup-show-common-commands nil
   magit-gh-pulls-pull-detail-limit 200
   magit-bury-buffer-function 'magit-mode-quit-window

   ;; Shell
   shell-default-term-shell "/bin/zsh"
   ))

(defun dotspacemacs/user-config ()
  (setq company-frontends
        '(company-tng-frontend
          company-pseudo-tooltip-unless-just-one-frontend
          company-echo-metadata-frontend
          company-preview-frontend
          company-quickhelp-frontend))

  ;; Redefining like this works for me.
  (defun company-preview-frontend (command)
    "`company-mode' frontend showing the selection as if it had been inserted."
    (pcase command
      (`pre-command (company-preview-hide))
      (`post-command
       (unless (and company-selection-changed
                    (memq 'company-tng-frontend company-frontends))
         (company-preview-show-at-point (point)
                                        (nth company-selection company-candidates))))
      (`hide (company-preview-hide))))
  ;;Settings
  (spacemacs/toggle-golden-ratio-on)
  (global-centered-cursor-mode +1)
  (yas-global-mode 1)
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
  (set-default 'semantic-case-fold t)

  ;; Windmove
  (windmove-default-keybindings)
  (add-hook 'org-shiftup-final-hook 'windmove-up)
  (add-hook 'org-shiftleft-final-hook 'windmove-left)
  (add-hook 'org-shiftdown-final-hook 'windmove-down)
  (add-hook 'org-shiftright-final-hook 'windmove-right)

  ;; Clang format
  (require 'clang-format)
  (global-set-key (kbd "C-c i") 'clang-format-region)
  (global-set-key (kbd "C-c u") 'clang-format-buffer)
  (setq clang-format-style-option "google")

  ;;Org
  (setq org-agenda-files (list "~/Dropbox/Org/Agenda.org"))
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/Dropbox/Org/Notes.org" "Tasks")
           "* TODO \nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n")
          ("n" "Note" entry (file+datetree+headline "~/Dropbox/Org/Notes.org" "Notes")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("d" "Deadline" entry (file "~/Dropbox/Org/Agenda.org")
           "* TODO \nDEADLINE: %^t")
          ))

  ;; Haskell
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-to-list 'exec-path "~/.local/bin/")

  ;; C-C++

  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))

  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
  (eval-after-load 'company
    '(add-to-list
      'company-backends '(company-irony-c-headers company-irony company-dabbrev company-semantic)))

  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-autojoin-mode t)
 '(erc-autojoin-timing (quote ident))
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (auctex-latexmk stickyfunc-enhance srefactor ranger pdf-tools tablist origami magit-gh-pulls github-search github-clone github-browse-file git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht diff-hl company-quickhelp company-auctex auctex xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode spotify helm-spotify multi erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks org-gcal evil-snipe spray gmail-message-mode ham-mode html-to-markdown flymd edit-server beacon web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data wolfram-mode thrift stan-mode scad-mode qml-mode matlab-mode julia-mode arduino-mode mmm-mode markdown-toc markdown-mode gh-md csv-mode flycheck-rtags flycheck-irony company-irony-c-headers cmake-ide levenshtein helm-rtags company-rtags rtags yaml-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic zenburn-theme flyspell-correct-helm flyspell-correct auto-dictionary google-c-style flymake-google-cpplint flymake-easy flymake-cursor clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider seq queue clojure-mode swiper ivy function-args smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor zonokai-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme flycheck-ycmd company-ycmd ycmd request-deferred let-alist deferred monokai-theme org-projectile org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode winum powerline spinner hydra parent-mode projectile fuzzy pkg-info epl flx smartparens iedit anzu evil goto-chg undo-tree highlight f s diminish irony bind-map bind-key packed dash helm avy helm-core async popup buffer-move company-irony helm-flycheck flycheck-pos-tip pos-tip flycheck helm-company helm-c-yasnippet disaster company-statistics company-c-headers company cmake-mode clang-format auto-yasnippet yasnippet ac-ispell auto-complete ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
