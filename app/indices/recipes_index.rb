ThinkingSphinx::Index.define :recipe, with: :active_record do

	# fields
	indexes title, sortable: true
	indexes summary
	indexes description

	# attributes
	has user_id, created_at, updated_at
end