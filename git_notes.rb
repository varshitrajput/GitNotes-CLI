require_relative "alias_logic"

class GitNotes < Formula
  desc "NotePad based on github, uses no ram or rom :)"
  homepage "https://github.com/varshitrajput"
  url "https://github.com/varshitrajput/GitNotes-CLI/archive/refs/tags/Alpha.tar.gz"
  sha256 "6c25c0b1cff41eedc5b0b83b6cb61bddc17e79eee3b58c51a308106c54947544"
  version "0.0.1"  # Make sure to update the version attribute


  def install
    puts "Installing GitNotes-CLI..."
    AliasLogic.modify_zsh_alias
  end
end
