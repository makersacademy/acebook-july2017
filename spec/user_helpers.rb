  def sign_up
    visit('/users/sign_up')
    fill_in 'user_first_name', with: 'Edward'
    fill_in 'user_last_name', with: 'Withers'
    select 1, :from => "user_date_of_birth_3i"
    select "May", :from => "user_date_of_birth_2i"
    select 1985, :from => "user_date_of_birth_1i"
    fill_in 'user_email', with: 'user@gmail.com'
    fill_in 'user_password', with: '123456abc.'
    fill_in 'user_password_confirmation', with: '123456abc.'
    fill_in 'user_hometown', with: 'London'
    fill_in 'user_occupation', with: 'Coach'
    fill_in 'user_bio', with: "I'm pretty cool and stuff. Now go feed the MonsterCat"
    click_button 'Sign up'
  end

  def sign_out
    click_link 'Sign out'
  end

  def login(email = "ladyruby@rails.com", password = "password123")
    visit("/users/sign_in")
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    within(:css, 'div.actions') do
      click_button 'Log in'
    end
  end
