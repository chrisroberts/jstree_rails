namespace :jstree_rails do

  desc' Install required assets'
  task :install do
    print 'Checking for asset directory... '
    FileUtils.mkdir_p(File.join(Rails.root, 'public', 'jstree_rails'))
    puts 'OK'
    print 'Removing any legacy assets... '
    FileUtils.rm_rf(File.join(Rails.root, 'public', 'jstree_rails', '*'))
    puts 'OK'
    print 'Installing assets... '
    FileUtils.cp_r(File.join(File.dirname(__FILE__), '..', '..', 'files', 'public', '.'), File.join(Rails.root, 'public', 'jstree_rails'))
    puts 'Done'
  end

  desc 'Upgrade required assets'
  task :upgrade do
    Rake::Task['jstree_rails:install'].invoke
  end

end
