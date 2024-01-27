module AliasLogic
  def self.modify_zsh_alias
    username = ENV["USER"]
    zshrc_path = File.join(Dir.home(username), ".zshrc")
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
