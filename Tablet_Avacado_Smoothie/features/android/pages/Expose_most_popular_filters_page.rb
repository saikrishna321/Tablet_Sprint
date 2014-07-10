require 'calabash-android/abase'

class Filters < Calabash::ABase
	include Helpers
	include TescoHelpers
	include Common_functions
	include Common_id


def search_for(item)
	wait_for_elements_exist ["* id:'SearchEditText' "], timeout: 30
	query("* id:'SearchEditText' ", :setText => "#{item}")
end