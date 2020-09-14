namespace :urls do
  desc "TODO"
  task delete_after_6_months: :environment do
    Url.where(['updated_at < ?', Time.now - 6.months]).destroy_all
  end
end
