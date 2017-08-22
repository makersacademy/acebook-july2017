  def sign_up
    visit('/users/sign_up')
    fill_in 'user_first_name', with: "Lady"
    fill_in 'user_last_name', with: "Ruby"
    select '2012', from: "user_date_of_birth_1i"
    select 'August', from: "user_date_of_birth_2i"
    select '22', from: "user_date_of_birth_3i"
    fill_in 'user_email', with: "ladyruby@rails.com"
    fill_in 'user_password', with: "password123"
    fill_in 'user_password_confirmation', with: "password123"
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
