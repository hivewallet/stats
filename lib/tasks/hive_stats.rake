namespace :hive_stats do

  desc "pull stats from github and save to database"
  task snapshot: :environment do
    releases = Github::Release::Stats.downloads("hivewallet/hive-osx")

    releases.each do |r|
      Release.create!(tag: r[0], download_count: r[1], raw: r[2].to_json)
    end
  end

end
