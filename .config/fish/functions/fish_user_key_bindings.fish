function fish_user_key_bindings
  bind \e\[A 'history --merge ; up-or-search'
  fzf_key_bindings
#  bind \cr 'fh
end
