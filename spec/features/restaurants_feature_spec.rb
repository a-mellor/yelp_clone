require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

   context 'restaurants have been added' do

     before do
       Restaurant.create(name: 'KFC', description: 'fried chicken')
     end

     scenario 'display restaurants' do
       visit '/restaurants'
       expect(page).to have_content('KFC')
       expect(page).not_to have_content('No resturants yet')
     end
   end

	 context 'creating restaurants' do
	 	scenario 'prompts user to fill out a form, then displays the new restaurant' do
	 		visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'KFC'
      fill_in 'Description', with: 'fried chicken'
			click_button 'Create Restaurant'
			expect(page).to have_content 'KFC'
			expect(current_path).to eq '/restaurants'
	 	end
	 end

	 context 'viewing restarants' do
	 	let!(:kfc){ Restaurant.create(name:'KFC', description: 'fried chicken') }

		scenario 'lets a user view restaurant' do
			visit '/restaurants'
			click_link 'KFC'
			expect(page).to have_content('KFC')
      expect(page).to have_content 'fried chicken'
			expect(current_path).to eq "/restaurants/#{kfc.id}"
		end
	 end

   context 'editing restaurants' do
     before do
       Restaurant.create(name: 'KFC', description: 'fried chicken')
     end

     scenario 'let a user edit a restaurant' do
       visit '/restaurants'
       click_link 'Edit KFC'
       fill_in 'Name', with: 'Kentucky Fried Chicken'
       fill_in 'Description', with: 'fried chicken'
       click_button 'Update Restaurant'
       expect(page).to have_content 'Kentucky Fried Chicken'
       expect(current_path).to eq '/restaurants'
     end
  end


	context 'deleting restaurants' do

	before do
		Restaurant.create(name: 'KFC', description: 'fried chicken')
	end

  scenario 'removes a restaurant when a user clicks a delete link' do
    visit '/restaurants'
    click_link 'Delete KFC'
    expect(page).not_to have_content 'KFC'
    expect(page).to have_content 'Restaurant deleted successfully'
  end

end


end
