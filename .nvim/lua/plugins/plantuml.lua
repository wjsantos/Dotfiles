# "sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk"
vim.cmd([[
  " au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
  "   \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
  "   \  1,
  "   \  0
  "   \)

  let g:plantuml_previewer#plantuml_jar_path="/opt/homebrew/Cellar/plantuml/1.2023.9/libexec/plantuml.jar"
]])
