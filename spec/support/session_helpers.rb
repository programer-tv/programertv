module SessionHelpers
  def fill_in_ckeditor(locator, params={})
		locator = find('label', text: locator)[:for] if page.has_css?('label',
                                                                  text: locator)
    page.execute_script <<-SCRIPT
        var ckeditor = CKEDITOR.instances.#{locator}
        ckeditor.setData('#{params[:with]}')
        ckeditor.focus()
        ckeditor.updateElement()
    SCRIPT
  end

  def signin(user)
		visit new_user_session_path
    fill_in "user_login", with: user.username
    fill_in "user_password", with: user.password
    click_on "user_signin_link"
  end
end
