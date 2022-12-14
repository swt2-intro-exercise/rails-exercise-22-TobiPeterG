describe "Author Index page", type: :feature do
  it "should contain an HTML table with the headings 'Name' and 'Homepage'" do
    visit authors_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_table("authors")
    expect(page).to have_xpath("//table/tr/th[text()='Name']")
    expect(page).to have_xpath("//table/tr/th[text()='Homepage']")
  end
  it "should list the full names as well as homepages of authors" do
    author = Author.new(first_name: "Alan",last_name: "Turing",homepage: "http://wikipedia.org/Alan_Turing")
    author.save
    visit authors_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_xpath("//table/tr/td[text()='#{author.name}']")
    expect(page).to have_xpath("//table/tr/td[text()='#{author.homepage}']")
  end
  it "should link to individual author's detail pages" do
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end
      it "should display author name and homepage" do
        @alan = FactoryBot.create :author
        visit author_path(@alan)
        expect(page).to have_text(@alan.first_name)
        expect(page).to have_text(@alan.last_name)
        expect(page).to have_text(@alan.homepage)
    end
end
