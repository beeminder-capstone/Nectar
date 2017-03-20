=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
feature "Sign in", :omniauth do
  context "with valid account" do
    scenario "user can sign in with valid account" do
      visit root_path
      mock_auth
      click_link "sign in"
      expect(page).to have_content("Sign out")

      click_link "Sign out"
      expect(page).to have_content "Signed out"
      expect(page.current_path).to eq(root_path)
      expect(page).to have_content("Sign in")
    end
  end

  scenario "user cannot sign in with invalid account" do
    OmniAuth.config.mock_auth[:beeminder] = :invalid_credentials
    visit root_path
    expect(page).to have_content("Sign in")
    click_link "Sign in"
    expect(page).to have_content("Authentication error")
  end
end
