require "open-uri"

namespace :hive_stats do
  desc "pull osx stats from github and save to database"
  task snapshot: :environment do
    releases = Github::Release::Stats.downloads("hivewallet/hive-osx")

    snapshot = Snapshot.new
    releases.each do |r|
      snapshot.releases.build(tag: r[0], download_count: r[1], raw: r[2].to_json)
    end
    snapshot.save!
  end

  desc "pull hive web & ios stats from cloudant, and save to database"
  task snapshot_web: :environment do
    url = "https://hive.cloudant.com/_users"
    json_response = open(url, http_basic_authentication: [ENV['DB_USER'], ENV['DB_PASSWORD']]).read
    user_docs = JSON.parse json_response
    WebWalletCount.create! count: user_docs['doc_count'], raw: json_response
  end
end
