users = {
  :admin_bestnid => { :name => "bestnid", :last_name => "bestnid", :username => "bestnid", :email => "admin@bestnid.com.ar", :email_confirmation => "admin@bestnid.com.ar", :password => "gaspar", :password_confirmation => "gaspar", :admin => true, :active => true },
  :no_admin_oby =>  { :name => "agustin", :last_name => "silva", :username => "oby", :email => "oby@bestnid.com.ar", :email_confirmation => "oby@bestnid.com.ar", :password => "gaspar", :password_confirmation => "gaspar", :admin => false, :active => true },
  :no_admin_kevin91j => { :name => "kevin", :last_name => "gomez", :username => "kevin91j", :email => "kevin91j@bestnid.com.ar", :email_confirmation => "kevin91j@bestnid.com.ar", :password => "gaspar", :password_confirmation => "gaspar", :admin => false, :active => true },
:admin_awf => { :name => "Awf", :last_name => "Wfa", :username => "awf", :email => "awf@bestnid.com.ar", :email_confirmation => "awf@bestnid.com.ar", :password => "123456", :password_confirmation => "123456", :admin => true, :active => true },
:no_admin_awd =>  { :name => "Awd", :last_name => "Dwa", :username => "awd", :email => "awd@bestnid.com.ar", :email_confirmation => "awd@bestnid.com.ar", :password => "123456", :password_confirmation => "123456", :admin => false, :active => true }
  
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
