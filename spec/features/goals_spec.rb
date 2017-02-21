require 'rails_helper'

feature 'Creating a goal' do
  before :each do
    sign_up_userserser
    visit new_goal_path
  end

  it 'has a new goal page' do
    expect(page).to have_content "New Goal"
  end

  it 'takes all of its parameters' do
    expect(page).to have_content "Title"
    expect(page).to have_content "Description"
    expect(page).to have_content "Privacy Setting"
  end
end

feature 'Seeing all the goals' do

end

feature 'Showing the goals' do

end

feature 'Editing the goals' do

end

feature 'Destroying the goals' do

end
