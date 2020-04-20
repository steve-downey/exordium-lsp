;;; LSP Initialization

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "C-c l")

(use-package lsp-mode
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ((c-mode c++-mode)  . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :init
  (setq-default lsp-clients-clangd-executable "clangd-10")

  :commands (lsp lsp-deferred)

  :config
  (setq lsp-clients-clangd-args '("-j=4" "-background-index" "-log=error"))

  (setq lsp-prefer-flymake nil) ;; flycheck

  ;; company mode configuration for lsp-mode
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0)

  ;; process buffer for the LSP server needs to be larger
  (setq read-process-output-max (* 1024 1024)) ;; 1mb

  ;; optionally
  (use-package lsp-ui
    :requires lsp-mode flycheck
    :init
    (setq lsp-ui-doc-enable nil
          lsp-ui-doc-use-childframe t
          lsp-ui-doc-position 'top
          lsp-ui-doc-include-signature t
          lsp-ui-sideline-enable t
          lsp-ui-flycheck-enable t
          lsp-ui-flycheck-list-position 'right
          lsp-ui-flycheck-live-reporting t
          lsp-ui-peek-enable nil
          lsp-ui-peek-list-width 60
          lsp-ui-peek-peek-height 25)
    :commands lsp-ui-mode)

  (use-package company-lsp
    :requires company
    :config
    (push 'company-lsp company-backends)

    ;; Disable client-side cache because the LSP server does a better job.
    (setq company-transformers nil
          company-lsp-async t
          company-lsp-cache-candidates nil
          company-lsp-enable-recompletion t)
    :commands company-lsp)

  ;; if you are helm user
  (use-package helm-lsp
    :commands
    (helm-lsp-workspace-symbol
     helm-lsp-global-workspace-symbol
     helm-lsp-code-actions))

  (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

  ;; optionally if you want to use debugger
  (use-package dap-mode
    :requires dap-lldb)

  ;; optional if you want which-key integration
  (use-package which-key
    :config
    (which-key-mode))
  )
;;; End of file
