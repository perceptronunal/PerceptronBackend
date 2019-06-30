class StatisticsController < ApplicationController

    def count_tag
        
        q = "SELECT \"Post_Tag\", COUNT(id) 
        FROM posts
        GROUP BY \"Post_Tag\";"

        render json: ActiveRecord::Base.connection.exec_query(q)

    end

end
