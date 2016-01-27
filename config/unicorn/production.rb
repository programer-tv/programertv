working_directory '/var/www/programertv/current'
pid '/var/www/programertv/current/tmp/pids/unicorn.pid'
stderr_path '/var/www/programertv/log/unicorn.log'
stdout_path '/var/www/programertv/log/unicorn.log'
listen '/tmp/unicorn.programertv.sock'
worker_processes 2
timeout 30

before_fork do |server, worker|
  old_pid = "/var/www/programertv/current/tmp/pids/unicorn.pid.oldbin"
  if old_pid != server.pid
    begin
    sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
    Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end
