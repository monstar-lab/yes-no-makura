worker_processes 2

listen File.expand_path('tmp/sockets/unicorn.sock')
pid    File.expand_path('tmp/pids/unicorn.pid')

stderr_path File.expand_path('log/unicorn.log')
stdout_path File.expand_path('log/unicorn.log')

preload_app true
