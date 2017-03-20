=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
require "rails_helper"
feature "Home page" do
  context "anonymouse user" do
    scenario "redirected to root" do
      visit root_path
      expect(page.current_path).to eq(root_path)
    end
  end
end
