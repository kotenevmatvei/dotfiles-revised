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

$env.PYENV_ROOT = ($env.HOME | path join ".pyenv")
if ($env.PYENV_ROOT | path join "bin" | path exists) {
  $env.PATH = ($env.PATH | prepend ($env.PYENV_ROOT | path join "bin"))
}

# Initialize pyenv shims for external commands
# pyenv prints shell code; in Nu, use its “--path” helpers instead of eval
# Ensure shims dir is on PATH so `python`, `pip`, etc., resolve through pyenv:
if ($env.PYENV_ROOT | path join "shims" | path exists) {
  $env.PATH = ($env.PATH | prepend ($env.PYENV_ROOT | path join "shims"))
}

$env.config.edit_mode = 'vi'
$env.config.buffer_editor = 'vi'
