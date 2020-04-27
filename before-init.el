;;; before-init.el --- LSP Options and Support

;;; Commentary

;;; Code

(defcustom exordium-lsp-clangd-executable "clangd"
  "The clangd executable to use.
Leave as just the executable name to use the default behavior of
finding the executable with `exec-path'."
  :group 'exordium
  :risky t
  :type 'file)

(defcustom exordium-lsp-clangd-args '("-j=4" "--background-index" "--log=verbose" "--clang-tidy")
  "Extra arguments for the clangd executable."
  :group 'exordium
  :risky t
  :type '(repeat string))

(defcustom exordium-enable-which-key t
  "If t, which-key mode will be enabled."
  :group 'exordium
  :type  'boolean)

;;; after-init.el ends here
