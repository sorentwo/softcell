namespace :db do
  desc 'Create a pg_dump of the current database'
  task :backup do
    env = ENV.fetch('RAILS_ENV').downcase

    puts 'Creating backup...'
    `pg_dump -c -F c -f ./softcell-$(date +%y-%m-%d).dump softcell_#{env}`
    puts 'Backup complete!'
  end
end
