json.extract! candidate, :id, :filer_id, :prefix_id, :office_held_id, :office_sought_id, :firstname, :lastname, :mi, :alias, :suffix, :phone, :extension, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)