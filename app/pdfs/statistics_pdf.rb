class StatisticsPdf < Prawn::Document
    def initialize()
        super(top_margin: 70)
        body
    end

    def body
        text "
        Estadísticas: 

        1. Número de personas registradas: #{User.count}
        2. Número de organizaciones registradas: #{Organization.count}
        3. Número de publicación: #{Post.count}
        4. Número de mascotas en adopción: #{Connection.where(Connection_Type: "Publicar").count}
        5. Número de mascotas adoptadas: #{Connection.where(Connection_Type: "Adoptado").count}
        6. Número de mascotas perdidas: #{Connection.where(Connection_Type: "Perdido").count}
        7. Número de mascotas encontradas: #{Connection.where(Connection_Type: "Encontrado").count}"
    end
end