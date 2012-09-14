namespace :spree_mobile_views do
  desc "Copies all migrations and assets (NOTE: This will be obsolete with Rails 3.1)"
  task :install do
    Rake::Task['spree_mobile_views:install:migrations'].invoke
    Rake::Task['spree_mobile_views:install:assets'].invoke
  end

  namespace :install do
    desc "Copies all migrations (NOTE: This will be obsolete with Rails 3.1)"
    task :migrations do
      source = File.join(File.dirname(__FILE__), '..', '..', 'db')
      destination = File.join(Rails.root, 'db')
      Spree::Core::FileUtilz.mirror_files(source, destination)
    end

    desc "Copies all assets (NOTE: This will be obsolete with Rails 3.1)"
    task :assets do
      source = File.join(File.dirname(__FILE__), '..', '..','app','assets')
      destination = File.join(Rails.root, 'app', 'assets')
      puts "INFO: Mirroring assets from #{source} to #{destination}"
      Spree::Core::FileUtilz.mirror_files(source, destination)
    end
  end

end
