require 'spec_helper'

describe 'contact us form', type: :feature do
  scenario 'has contact us form', js: true do
    visit '/'
    expect(page).to have_content 'CONTACT US'
  end

  scenario 'user can submit a message to Lockstep', js: true do
    visit '/'
    within '#contact-form' do
      fill_in 'name', with: 'John'
      fill_in 'email', with: 'john@gmail.com'
      fill_in 'subject', with: 'hello'
      fill_in 'message', with: 'world'
    end
    find('.btn-submit').click

    mail_result = find('#mail-result')
    expect(mail_result).to have_content 'Thank you'
  end
end
