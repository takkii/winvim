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

  def self.prism
    myhome = File.expand_path('~/.vimrc')
    File.open(myhome, 'a:utf-8', perm = 0o777) do |f|
      f.puts <<-DOC
" deoplete.nvim.
if filereadable(expand('~/winvim/.rocky-vimrc'))
  source ~/winvim/.rocky-vimrc
endif
      DOC
    end
    puts ".rocky-vimrc has been created and configured."
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

begin
  host_os = RbConfig::CONFIG['host_os']
  app_root = File.expand_path("../..", __FILE__)
  case host_os
  when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
    begin
      Dark.matter
      Dark.power
    rescue Exception => e
      puts e.backtrace
    end
  when /darwin|mac os/
    # Nothing.
  when /linux/
    begin
      Dark.prism
    rescue Exception => e
      puts e.backtrace
    end
rescue StandardError => ex
  puts ex.printStackTrace
rescue Exception => er
  puts er.printStackTrace
ensure
  GC.compact
end

