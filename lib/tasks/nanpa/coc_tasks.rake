# desc "Explaining what the task does"
# task :rails_nanpa_coc do
#   # Task goes here
# end

namespace :nanpa do
  desc "Download NANPA COC database"
  task :download do
    require 'fileutils'
    target_dir = Rails.root.join('tmp', 'db')
    FileUtils.mkdir_p(target_dir)
    target_zip = File.join(target_dir, 'allutlzd.zip')
    system("curl https://nationalnanpa.com/nanp1/allutlzd.zip --output #{target_zip}")
    system("cd #{target_dir} && unzip allutlzd.zip && rm allutlzd.zip")
  end

  desc "Import NANPA COC database from TSV file into ActiveRecord"
  task import: :environment do
    NANPA::COC::Importer.new(file_path: Rails.root.join('tmp', 'db', 'allutlzd.txt')).run!
  end
end
