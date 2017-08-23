let(:email) {'user@gmail.com'}
let(:password) {'123456abc.'}
let(:first_name) {'Edward'}
let(:last_name) {'Withers'}
let(:date_of_birth) {"1890-08-22 00:00:00"}
let(:hometown) {'London'}
let(:occupation) {'Coach'}
let(:bio) {"I'm pretty cool and stuff. Now go feed the MonsterCat"}

  def sign_up
    visit('/users/sign_up')
    fill_in 'user_first_name', with: first_name
    fill_in 'user_last_name', with: last_name
    select 1890, :from => "user_date_of_birth_1i"
    select "May", :from => "user_date_of_birth_2i"
    select 1, :from => "user_date_of_birth_3i"
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    fill_in 'user_hometown', with: hometown
    fill_in 'user_occupation', with: occupation
    fill_in 'user_bio', with: bio
    click_button 'Sign up'
  end

  def sign_out
    click_link 'Sign out'
  end

  def login
    visit("/users/sign_in")
    fill_in 'user_email', with: "ladyruby@rails.com"
    fill_in 'user_password', with: "password123"
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
  end
