# Comments

## Ruby

`ruby-install` is installed with brew. Next
```
ruby-install ruby 1.9
ruby-install ruby 2.0
cd ~/.rubies
ln -s 1.9.3-p448 1.9.3
ln -s 2.0.0-p247 2.0
```

Add to `~/.config/direnv/direnvrc`
```
use_ruby() {
  local ruby_dir=$HOME/.rubies/$1
  load_prefix $ruby_dir
  layout ruby
}
```

Now in any project you can run `direnv edit .`, then add e.g. `use ruby 1.9.3` and direnv will select the right ruby version.
