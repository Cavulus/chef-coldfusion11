define :coldfusion11_service do

 # Set up instance as a service
  service params[:name] do
    pattern "\\-Dcoldfusion\\.home=#{node['cf11']['installer']['install_folder'].gsub('/','\\\\/')}\\/#{params[:instance]} .* com\\.adobe\\.coldfusion\\.bootstrap\\.Bootstrap \\-start"
    status_command "ps -ef | grep '\\-Dcoldfusion\\.home=#{node['cf11']['installer']['install_folder'].gsub('/','\\\\/')}\\/#{params[:instance]} .* com\\.adobe\\.coldfusion\\.bootstrap\\.Bootstrap \\-start'" if platform_family?("rhel")
  	supports :status => true, :start => true, :stop => true, :restart => true
    action [ :enable ]
  end

end
