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
end
