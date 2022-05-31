namespace :notification do
  desc 'Send emails to all users.'

  task :send_emails_from_admin, ['msg'] => :environment do |task, args|
    msg = args['msg']
    if msg.present?
      NotificationFromAdminJob.perform_later(msg)
    else
      puts 'ERROR 送信できませんでした。メッセージを入力してくてださい。ex. rails notification:send_emails_from_admin\[こんにちは\]'
    end
  end
end
