here is what im seeing

2 sidekiq workers process individual jobs very very fast. 25 proc process slower, but roughly the same total time for 1000 jobs.
the more you increase the workers, the slower each job gets

i've extracted this code from my other project. i've even tried mysql instead of postgres.

# To duplicate:

```
RAILS_ENV=production rake db:setup
RAILS_ENV=production rake db:seed
```

## term #1

```
RAILS_ENV=production RAILS_ENV=production bundle exec sidekiq -C config/sidekiq.yml
```

## term #2

```
RAILS_ENV=production bundle exec rails console
100.times {|i| SlowWorker.perform_async({}) }
```

increase/decrease sidekiq.yml workers, and notice the processing time in the logs, as well as wall time

am i missing something?
