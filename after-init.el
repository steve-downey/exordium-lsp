;;; LSP Initialization

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "C-c l")

(use-package lsp-mode
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ((c-mode c++-mode)  . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :init (setq-default lsp-clients-clangd-executable "clangd-10")
  :commands lsp lsp-deferred)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
(use-package dap-lldb)

;; optional if you want which-key integration
(use-package which-key
  :config
  (which-key-mode))

;;; End of file
