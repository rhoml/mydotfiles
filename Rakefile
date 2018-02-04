# All credits of this script goes to @arkham
# https://github.com/Arkham/dotfiles/blob/master/Rakefile

task :default => [:backup_dir, :backup, :link]

WHOAMI = ENV['USER']
DOTFILES_DIR = "/Users/#{WHOAMI}/.dotfiles"
BACKUP_DIR = "/Users/#{WHOAMI}/.dotfiles-backup"
DOTFILES = %w(
  Brewfile
  curlrc
  dockerignore
  gemrc
  gitignore
  gitconfig
  gitcookies
  gitmessage
  mrconfig
  mrtrust
  siegerc
  spacemacs
  ssh
  tmux.conf
  wgetrc
  zprofile
  zsh.d
  zshrc
)

desc %(Make symlinks of dotfiles)
task :link do
  DOTFILES.each do |script|
    dotfile = File.join(ENV['HOME'], ".#{script}")
    if File.exist? dotfile
      warn "~/.#{script} already exists"
    else
      ln_s File.join(DOTFILES_DIR, ".#{script}"), dotfile
    end
  end
end

desc %(Backup existing dotfiles)
task :backup do
  DOTFILES.each do |script|
    dotfile = File.join(ENV['HOME'], ".#{script}")
    if File.exist?(dotfile) && !File.symlink?(dotfile)
      backup = File.join(BACKUP_DIR, script)
      if File.exists? backup
        warn "#{BACKUP_DIR}/#{script} already exists"
      else
        mv dotfile, backup
      end
    end
  end
end

desc %(Create backup dir)
task :backup_dir do
  mkdir_p BACKUP_DIR unless File.directory?(BACKUP_DIR)
end

