ThinkingSphinx::Index.define :post, with: :active_record do
	# fields
	indexes title, sortable: true
	indexes content

end