class GitNotes < Formula
  desc "NotePad based on github, uses no ram or rom :)"
  homepage "https://github.com/varshitrajput"
  url "https://github.com/varshitrajput/GitNotes-CLI/archive/refs/tags/Alpha.tar.gz"
  sha256 "6c25c0b1cff41eedc5b0b83b6cb61bddc17e79eee3b58c51a308106c54947544"
  version "0.0.1"  # Make sure to define the version attribute


  def install
    puts "Installing GitNotes-CLI..."
    modify_zshrc
  end

  def modify_zshrc
    zshrc_path = File.join(Dir.home, ".zshrc")
    content = <<~EOS
      alias create_new_note='new_note'
      alias save_notes='save_note'
      alias show_notes='cd; cd Personal-notes; ls -l'

      new_note(){
          cd; cd Personal-notes; git checkout main; touch $1.md ; vim $1.md
      }

      save_note(){
          cd; cd Personal-notes; git add . ; git commit -m $1; git push; open -a "Safari" https://github.com/varshitrajput/Personal-notes/blob/main/varshit.md;
      }
    EOS

    if File.read(zshrc_path).include?(content)
      puts "Already Installed"
    else
      File.open(zshrc_path, "a") { |f| f.puts(content) } 
      puts "Installed"
    end
  end
end
