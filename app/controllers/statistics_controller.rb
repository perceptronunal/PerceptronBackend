class StatisticsController < ApplicationController

    def index

        respond_to do |format|
            format.pdf do
              pdf = StatisticsPdf.new()
              send_data pdf.render,
                filename: "statistics.pdf",
                type: 'application/pdf',
                disposition: 'inline'
            end
        end

    end

   def count_tag
        
        q = "SELECT \"Post_Tag\", COUNT(id) 
        FROM posts
        GROUP BY \"Post_Tag\";"

      render json: ActiveRecord::Base.connection.exec_query(q)

    end

    def count_month

        q = "select to_char(\"created_at\",'Mon') as mes, count(*)
        from users
        group by mes;"

        render json: ActiveRecord::Base.connection.exec_query(q)

    end

end
