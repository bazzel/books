Given("I open the application") do
  visit '/'
end

Given("I navigate to page for adding a new book") do
  visit(new_book_path)
end

When("I choose {string} from the navigation drawer") do |menu|
  step %q(I open the application)
  find('nav button.navbar-toggler').click

  within('.navdrawer-nav') do
    # Menu items also contain an icon that are displayed as text
    # so we need to use a regex.
    find('a', text: /#{menu}/).click
  end
end

When("I choose {string} from the account menu") do |string|
  within('nav') do
    click_on @user.email
    click_on 'Profile'
  end
end

When("I navigate back") do
  within('nav.navbar') do
    click_on 'arrow_back'
  end
end
