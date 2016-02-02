define :coldfusion11_service do

  # Set up instance as a service
  service params[:name] do
	supports :status => true, :start => true, :stop => true, :restart => true
    action [:enable]
  end

end
