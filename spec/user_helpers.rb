def sign_up
    visit('/users/sign_up')
    within(:css, 'form.new_user') do
    fill_in 'user_first_name', with: 'Edward'
    fill_in 'user_last_name', with: 'Withers'
    select 1985, :from => "user_date_of_birth_1i"
    select "May", :from => "user_date_of_birth_2i"
    select 1, :from => "user_date_of_birth_3i"
      fill_in 'user_email', with: 'user@gmail.com'
      fill_in 'user_password', with: '123456abc.'
      fill_in 'user_password_confirmation', with: '123456abc.'
      fill_in 'user_hometown', with: 'London'
      fill_in 'user_occupation', with: 'Coach'
      fill_in 'user_bio', with: "I'm pretty cool and stuff. Now go feed the MonsterCat"
      click_button 'Sign up'
    end
  end

  def login(user)
    visit("/users/sign_in")
    within(:css, 'form.new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
    end
  end
