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

        #render json: ActiveRecord::Base.connection.exec_query(q)
        render json: [{"mes":"Jul","count":8},{"mes":"Oct","count":8},{"mes":"Aug","count":8},{"mes":"May","count":12},{"mes":"Nov","count":9},{"mes":"Dec","count":14},{"mes":"Jan","count":6},{"mes":"Feb","count":7},{"mes":"Apr","count":5},{"mes":"Mar","count":7},{"mes":"Jun","count":9},{"mes":"Sep","count":11}]
    end

end
