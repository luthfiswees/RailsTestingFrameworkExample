require_relative '../rails_helper'

describe 'page renders' do

	before :all do
		FactoryGirl.create(:order)
		FactoryGirl.create(:pay)
		@time = Time.now.to_i
	end

	before :each do 
		Capybara.javascript_driver = :webkit
		Capybara.current_driver = :selenium
	end
	
	it "should render index page" do
		visit 'demo/index'
		save_and_open_page # saves current snapshot of page
		print page.html
		save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/home.png") # save screenshot
		Percy::Capybara.snapshot(page, name: "home_page")
	end

	it "should render store page" do
		visit 'demo/store'
		save_and_open_page # saves current snapshot of page
		print page.html
		save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/store.png") # save screenshot
		Percy::Capybara.snapshot(page, name: "store_page")
	end

	it "should render paylist page" do
		visit 'demo/paylist'
		save_and_open_page # saves current snapshot of page
		print page.html
		save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/paylist.png") # save screenshot
		Percy::Capybara.snapshot(page, name: "paylist_page")
	end

	it "should render Veritrans Payment Web" do 
		# visit 'demo/pay_transaction'
		# save_and_open_page # saves current snapshot of page
		# print page.html
		# save_screenshot("#{Rails.root}/spec/screenshot/#{@time}/veritrans-payment.png") # save screenshot
	end

end