class Country < ActiveRecord::Base
  set_table_name "world_factbk_simplified"
  set_primary_key "gid"
end
