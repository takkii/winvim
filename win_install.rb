# frozen_string_literal: true
#!/usr/bin/ruby

class Dark
  def self.matter
    myhome = File.expand_path('~/.vimrc')
    File.open(myhome, 'a:utf-8', perm = 0o777) do |f|
      f.puts <<-DOC
" deoplete.nvim.
if filereadable(expand('~/GitHub/winvim/.vimrc'))
  source ~/GitHub/winvim/.vimrc
endif
      DOC
    end
    puts ".vimrc has been created and configured."
end

  def self.power
    myhome = File.expand_path('~/.gvimrc')
    File.open(myhome, 'a:utf-8', perm = 0o777) do |f|
      f.puts <<-DOC
" deoplete.nvim.
if filereadable(expand('~/GitHub/winvim/.gvimrc'))
  source ~/GitHub/winvim/.gvimrc
endif
      DOC
    end
    puts ".gvimrc has been created and configured."
  end
end

Dark.matter
Dark.power
