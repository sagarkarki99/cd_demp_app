def root_path
    Dir.pwd.sub(/.*\Kfastlane/, '').sub(/.*\Kandroid/, '').sub(/.*\Kios/, '').sub(/.*\K\/\//, '')
  end
  
  lane :sh_on_root do |options|
    command = options[:command]
    sh("cd #{root_path} && #{command}")
  end 