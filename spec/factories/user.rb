FactoryGirl.define do
  factory(:user) do
    current_sign_in_at nil
    current_sign_in_ip nil
    email "admin@bla.com"
    encrypted_password "ToFactory: RubyParser exception parsing this attribute"
    last_sign_in_at nil
    last_sign_in_ip nil
    remember_created_at nil
    reset_password_sent_at nil
    reset_password_token nil
    sign_in_count 0
  end
end
