# skaffold.plugin.zsh

Zsh integration and completions for [skaffold](https://skaffold.dev), local kubernetes development.

## Installation

### Using [zplug](https://github.com/zplug/zplug)
Load skaffold.plugin.zsh as a plugin in your `.zshrc`

```shell
zplug "todie/skaffold.plugin.zsh", defer:2

```
### Using [zgen](https://github.com/tarjoilija/zgen)

Include the load command in your `.zshrc`

```shell
zgen load todie/skaffold.plugin.zsh
zgen save
```

### Using [Antigen](https://github.com/zsh-users/antigen)

Bundle skaffold.plugin.zsh in your `.zshrc`

```shell
antigen bundle todie/skaffold.plugin.zsh
antigen apply
```

### As an [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) custom plugin

Clone skaffold.plugin.zsh into your custom plugins repo

```shell
git clone https://github.com/todie/skaffold.plugin.zsh $HOME/.oh-my-zsh/custom/plugins/skaffold
```
Then load as a plugin in your `.zshrc`

```shell
plugins+=(skaffold)
```
