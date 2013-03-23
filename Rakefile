#!/usr/bin/env rake
require "rubygems"
require "exogenesis"

Output.fancy

package_managers = [
  Dotfile.new,
  OhMyZSH.new("bitboxer"),
  Vundle.new,
  Fonts.new
]

desc "Setup the dotfiles"
task :setup do
  package_managers.each(&:setup)
end

desc "Install the dotfiles"
task :install do
  package_managers.each(&:install)
end

desc "Update everything"
task :update do
  package_managers.each(&:update)
end

desc "Uninstall the dotfiles"
task :uninstall do
  package_managers.each(&:teardown)
end
