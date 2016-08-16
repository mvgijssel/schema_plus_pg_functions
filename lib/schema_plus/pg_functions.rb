require 'schema_plus/core'

require_relative 'pg_functions/version'

# Load any mixins to ActiveRecord modules, such as:
#
#require_relative 'pg_functions/active_record/base'

# Load any middleware, such as:
#
# require_relative 'pg_functions/middleware/model'

SchemaMonkey.register SchemaPlus::PgFunctions
