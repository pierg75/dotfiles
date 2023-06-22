Install rust:
```
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Install starship:
```
$ cargo install starship
```

Add this to zshrc:
```
eval "$(starship init zsh)"
```

Install sheldon
```
cargo install sheldon
```
Initialise sheldon:
```
sheldon init --shell zsh
```

Add this to the zshrc to automatically load plugins:
```
source <(sheldon source)
```

Copy the `zsh_functions` into `$HOME/.zsh_functions` to get some extra functionality
