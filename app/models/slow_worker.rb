class SlowWorker
  include Sidekiq::Worker
 # sidekiq_options :queue => :important


  def perform(params_hash)
    # logger = Logger.new("#{Rails.root}/log/slow_worker.log")
    ActiveRecord::Base.connection_pool.with_connection do
      alert = Alert.where(:id => 1).joins(:school).includes(:school).first
      if params_hash['email']
        # logger.info('about to create message')
        s = Time.now
        message = AlertMailer.alert(alert,params_hash['email'])
        # logger.info("created message #{Time.now-s}")
      end
      if params_hash['send']
        s=Time.now
        message.deliver
        # logger.info "delivery took #{Time.now-s}\n"
      end
    end

  end
end


  # r = []; 1000.times {|i| r << [{'email' => 'd@example.com', 'send' => false}] }
   # Sidekiq::Client.push_bulk('class' => SlowWorker, 'args' => r)

   # 1000.times {|i| SlowWorker.perform_async({'email' => 'f@f.com'}) }
