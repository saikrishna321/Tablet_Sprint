Smoothie Tablet Sprint 
Tools:Calabash-android


require 'calabash-android/management/adb'
require 'calabash-android/operations'
require 'fileutils'
require 'RMagick'
include Magick
Before do |scenario|
#checks if the scenario is outlined
#copies default value 390 error code to test_data.txt under search
	project_path=File.expand_path("../../../", __FILE__)
	path= project_path + "/test_data/search/default_testdata.txt"
	dest=File.open(path, "w+")
	##writing new data to the file test_data.txt
	source=File.open(project_path + "/test_data/search/test_data.txt")
	IO.copy_stream(source, dest)
	#copies default value 390 error code to test_data.txt under specialoffers
	project_path=File.expand_path("../../../", __FILE__)
	path= project_path + "/test_data/specialoffers/default_testdata.txt"
	dest=File.open(path, "w+")
	##writing new data to the file test_data.txt
	source=File.open(project_path + "/test_data/specialoffers/test_data.txt")
	IO.copy_stream(source, dest)

	@scenario_is_outline = (scenario.class == Cucumber::Ast::OutlineTable::ExampleRow)
	if @scenario_is_outline
		@@arg_value = scenario.to_hash
		@@project_path=File.expand_path("../../../", __FILE__)
		@@path_scenario_outline= @@project_path +'/' +scenario.source_tag_names[0]
		unless File.directory?(@@path_scenario_outline)
			FileUtils.mkdir_p(@@path_scenario_outline)
		end
		@@argument_scenario_outline=@@arg_value['arg'].tr(" ", "_")
		@@scenario_outline_folder=@@path_scenario_outline+'/'+@@argument_scenario_outline
		FileUtils.rm_rf(Dir.glob(@@scenario_outline_folder+'/*.png'+''))
		unless File.directory?(@@scenario_outline_folder)
			FileUtils.mkdir_p(@@scenario_outline_folder)
		end

	else
		#scenario.source_tag_names[0]- will return the tag value for the current active scenario
		@@project_path=File.expand_path("../../../", __FILE__)
		@@path= @@project_path +'/' +scenario.source_tag_names[0]
#removes files all images from folder
		FileUtils.rm_rf(Dir.glob(@@path+'/*.png'+''))
#creates the folder with tag name if not present
		unless File.directory?(@@path)
			FileUtils.mkdir_p(@@path)
		end
	end
	start_test_server_in_background
end

AfterStep do |scenario|
	sleep 1.5
	if @scenario_is_outline
		screenshot(:prefix => @@scenario_outline_folder+'/'+'', :name => "sc_#{Time.now.to_i}")
	else
		screenshot(:prefix => @@path+'/'+'', :name => "sc_#{Time.now.to_i}")
	end

end

After do |scenario|
	if scenario.failed?
		unless File.directory?(@@project_path +'/screenshot')
			FileUtils.mkdir_p(@@project_path+'/screenshot')
		end
		screenshot_embed(:prefix => @@project_path+'/screenshot/')
	end
	if @scenario_is_outline
		image=ImageList.new(*Dir[@@scenario_outline_folder+'/*.png'])
		image.delay =90
		image.write(@@project_path+'/'+@@argument_scenario_outline+'.gif'+'')
		embed(@@argument_scenario_outline+'.gif'+'', 'image/gif', @@argument_scenario_outline)

	else
		anim = ImageList.new(*Dir[@@path+'/*.png'])
		anim.delay =70
		anim.write(@@path+'.gif'+'')
		embed(scenario.source_tag_names[0]+'.gif'+'', 'image/gif')
	end

	shutdown_test_server
end

