module Features
  module SessionHelpers
    def sign_in
      visit "/users/sign_in"
      user = create(:user)
      fill_form(:user, {email:user.email, password:'Password1'} )

      click_on "Log in"
    end

    def tempfile
      tempfile = Tempfile.new(['temp', ".mp4"])
      tempfile.write(Kernel.rand)
      tempfile.flush
      tempfile.rewind
      tempfile
    end
  end
end
