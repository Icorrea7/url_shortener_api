set :environment, "development"
every 1.hour do
    rake "urls:delete_after_6_months"
end