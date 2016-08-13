environment ENV['RACK_ENV']
threads 1,1

workers 2
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
