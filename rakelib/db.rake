require 'sequel'

namespace :db do
  def db_name
    'rubychat'
  end

  def db_url
    fallback_url = "postgres://postgres@localhost:5432/#{db_name}"
    ENV.fetch('POSTGRES_URL', fallback_url)
  end

  def with_database(&block)
    Sequel.connect(db_url, &block)
  end

  def with_postgres(&block)
    Sequel.connect(File.dirname(db_url), &block)
  end

  def database_exists?(database)
    cmd = "SELECT 1 from pg_database WHERE datname='#{db_name}'"
    database.execute(cmd) == 1
  end

  desc 'Create database'
  task :create do
    with_postgres do |db|
      if database_exists?(db)
        warn "Database #{db_name} already exists"
      else
        db.execute("CREATE DATABASE #{db_name}")
        puts "Database #{db_name} successfully created"
      end
    end
  end

  desc 'Drop database'
  task :drop do
    with_postgres do |db|
      if database_exists?(db)
        db.execute("DROP DATABASE #{db_name}")
        puts "Database #{db_name} successfully dropped"
      else
        warn "Database #{db_name} not found"
      end
    end
  end

  desc 'Run database migrations'
  task :migrate do
    with_database do |db|
      directory = 'db/migrations'
      if Dir.exist?(directory) && !Dir.empty?(directory)
        Sequel.extension :migration
        Sequel::Migrator.run(db, directory)
      end
    end
  end

  desc 'Migrate database to given version'
  task :migrate_to, [:version] do |_, args|
    raise 'version missing' unless args[:version]

    version = args[:version].to_i
    with_database do |db|
      Sequel.extension :migration
      Sequel::Migrator.run(db, 'db/migrations', target: version)
    end
  end
end
