users = {
  :user_admin => { :name => "bestnid", :last_name => "bestnid", :username => "bestnid", :email => "admin@bestnid.com.ar", :email_confirmation => "admin@bestnid.com.ar", :password => "gaspar", :password_confirmation => "gaspar", :admin => true, :active => true },
  :user_no_admin =>  { :name => "agustin", :last_name => "silva", :username => "oby", :email => "oby@bestnid.com.ar", :email_confirmation => "oby@bestnid.com.ar", :password => "gaspar", :password_confirmation => "gaspar", :admin => false, :active => true }
}

def create_user(user_values)
  user = User.new user_values
  user.save
end

task create_users: :environment do
  puts "############ BEGIN create_users"
  User.destroy_all

  users.each_pair do |user_key, user_values|
    puts "-> #{user_key}"
    create_user(user_values)      
  end
  puts "############ END create_users"
end