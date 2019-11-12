# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Votes", type: :feature do
  scenario "Can upvote posts" do
    pending
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Hedgehog'
    expect(page).to have_content('Hedgehog 1')
    expect(page).to have_content('Badger 0')
  end

  scenario "A user cannot add more than one upvote to a post" do
    pending
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Hedgehog'
    click_link 'Hedgehog'
    expect(page).to have_content('Hedgehog 1')
    expect(page).to have_content('Badger 0')
  end

  scenario "Additional users can add an upvote to a post" do
    pending
    visit('/')
    create_user
    login_user
    create_post
    click_link 'Hedgehog'
    logout_user
    create_user_two
    login_user_two
    click_link 'Hedgehog'
    expect(page).to have_content('Hedgehog 2')
    expect(page).to have_content('Badger 0')
  end
end