namespace :greet do
  desc 'Send emails to all users in the morning.'

  task :send_emails_morning => :environment do
    NotificationFromAdminJob.perform_later(
      'おはようございます。今日も一日頑張りましょう。'
    )
  end
end
