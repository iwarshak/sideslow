class SlowWorker
  include Sidekiq::Worker
 # sidekiq_options :queue => :important


  # def perform(params_hash)
  #   logger = Logger.new("#{Rails.root}/log/slow_worker.log")
  #   # ActiveRecord::Base.connection_pool.with_connection do
  #     alert = Alert.where(:id => 1).joins(:school).includes(:school).first
  #     if params_hash['email']
  #       # logger.info('about to create message')
  #       s = Time.now
  #       message = AlertMailer.alert(alert,params_hash['email'])
  #       # logger.info("created message #{Time.now-s}")
  #     end
  #     if params_hash['send']
  #       s=Time.now
  #       message.deliver
  #       # logger.info "delivery took #{Time.now-s}\n"
  #     # end
  #   end

  # end

  # def perform(h)
  #   Http.get("http://www.google.com")
  #   # results
  #   # 1000 jobs
  #   # 19 sec -25 workers
  #   # 14 sec - 50 workers
  #   # 12 sec - 100 workers
  # end

  # def perform(h)
  #   Http.get("http://www.google.com")
  #   School.find(1)
  #   # results
  #   # 1000 jobs
  #   # 20 sec -25 workers
  #   # 13 sec - 50 workers
  #   # 16 sec  - 100 workers
  # end

  def perform(h)
    Pony.mail({
      :to => 'f@example.com',
      :via => :smtp,
      :subject => 'wow',
      :body => 'hrm',
      :via_options => {
        :address        => '127.0.0.1',
        :port           => '1025'
      }
    })

    # results
    # 1000 jobs
    # 74 sec - 2 workers
    # 66 sec - 25 workers
    # 67 sec - 50 workers
    # 73 sec - 100 workers
    #
  end
end

