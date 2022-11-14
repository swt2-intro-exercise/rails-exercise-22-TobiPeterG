 
describe "Paper index page", type: :feature do
      it "should have a link to the edit paper page" do
        @paper = FactoryBot.create :paper
        visit papers_path
        expect(page).to have_link('Edit', href: edit_paper_path(@paper))
    end
end
