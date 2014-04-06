set :branch, :master

server 'miser.cinek.co',
  roles: %w{web app db},
  ssh_options: {
    forward_agent: true
  }

