require File.dirname(__FILE__) + '/spec_helper'

describe 'Email Sender' do
  context '#send_message' do
    it "lets you send emails" do
      email_content = File.read(ENV['EMAIL_DATA_FILE'])
      credentials, recipients, subject, body = email_content.split("\n")
      email, password = credentials.split(',')

      fill_email_form email, password, recipients, subject, body

      selector('#send_message').click
      expect(page).not_to have_content("An error occurred: ")
    end
  end
end

