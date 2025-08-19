# config.nu
#
# Installed by:
# version = "0.106.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

# Set PYENV_ROOT
let-env PYENV_ROOT = ($nu.home-path | path join ".pyenv")

# Prepend pyenv's bin to PATH if it exists
let pyenv_bin = ($env.PYENV_ROOT | path join "bin")
if ($pyenv_bin | path exists) {
  let-env PATH = ($env.PATH | split row (char esep) | prepend $pyenv_bin | uniq | str join (char esep))
}

# Initialize shims in PATH
let pyenv_shims = ($env.PYENV_ROOT | path join "shims")
if ($pyenv_shims | path exists) {
  let-env PATH = ($env.PATH | split row (char esep) | prepend $pyenv_shims | uniq | str join (char esep))
}

# Optional: set PYENV_SHELL so pyenv knows the shell
let-env PYENV_SHELL = "nu"

# Load pyenv env into Nushell (sets PYENV_SHELL, hooks, etc.)
try { ^pyenv init - nu | load-env } catch { }

# Load pyenv-virtualenv env (enables `pyenv activate/deactivate` and auto-activation)
try { ^pyenv virtualenv-init - nu | load-env } catch { }


$env.config.edit_mode = 'vi'
$env.config.buffer_editor = 'vi'
