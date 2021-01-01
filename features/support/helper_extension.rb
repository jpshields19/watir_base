module Setup
  def new_page(name)
    @page = Helper::PageObject.new(@browser, name)
    @page.make_forms
    return @page
  end
end

World(Setup)
