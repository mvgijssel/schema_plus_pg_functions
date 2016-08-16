module SchemaPlus
  module PgFunctions
    module ObjectCreationMethods
      # TODO: these two helpers should be in the pg_functions gem
      def create_function(name = 'someaggfunc', arguments: ['integer', 'integer'])
        function_arguments = arguments.each_with_index.map do |argument, index|
          "$#{index + 1}"
        end
        ActiveRecord::Base.connection.execute <<-SQL
          CREATE FUNCTION #{name}(#{arguments.join(', ')}) RETURNS integer
            LANGUAGE sql
            AS $_$
              SELECT #{function_arguments.join(' + ')}
            $_$;
        SQL
      end

      def drop_functions
        results = ActiveRecord::Base.connection.query(<<-SQL, 'SCHEMA')
          SELECT
            'DROP FUNCTION ' || n.nspname || '.' || proname || '(' || oidvectortypes(proargtypes) || ')' || ' CASCADE;'
          FROM
            pg_proc p
          INNER JOIN pg_namespace n ON n.oid = p.pronamespace
          INNER JOIN pg_language l ON l.oid = p.prolang
          WHERE p.proisagg = false
            AND n.nspname = ANY (current_schemas(false))
            AND l.lanname NOT IN ('c', 'internal')
        SQL

        results.each do |result|
          # TODO for some reason every result is an array with a single item?
          ActiveRecord::Base.connection.execute result[0]
        end
      end
    end
  end
end
