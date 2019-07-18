class PetPdf < Prawn::Document
    def initialize(current_user_id)
        @current_user = User.find(current_user_id)
        super(top_margin: 70)

        body
        #line_items
    end

    def body
        text "
        RECOMENDACIONES: 

        1. Visitas mensuales al veterinario, se sugiere que el médico sea una persona consiente, protectora y amante de los animalitos, deberá ser siempre el mismo profesional de manera que conozca desde el inicio al paciente que estará tratando 
        2. El animalito deberá estar al día con sus vacunas, vitaminas y desparacitantes.
        3. Si el animalito adoptado es un gatito deberá por lo menos permancer dentro de casa hasta que conozca el sitio y se adapte a sus nuevos dueños 20 días, para que juntamente con la compañía de sus amos conozca y comparte sitios como el patio de su casa, entre otros.
        4. Se enviarán fotos regularmente a: #{@current_user[:User_Email]}, con el fin de realizar el seguimiento del estado, trato y medio en el que se desenvuelve el animalito adoptado; también así se podrá mantener actualizada nuestra base de datos.
    
    AL FIRMAR ESTE DOCUMENTO, EL  ADOPTANTE  ACEPTA  QUE:
    
        1. El adoptado será un miembro más de su familia.
        2. El adoptado tendrá en todo momento agua limpia con libre acceso.
        3. El adoptado tendrá una alimentación balanceada a base de croqueta seca.
        4. El adoptado usará SIEMPRE UN COLLAR CON SU PLACA DE IDENTIFICACIÓN (con nombre y teléfono del responsable)
        5. El adoptado no será en ningún caso golpeado, maltratado, humillado, abandonado, ni regalado.
        6. El adoptado debe contar con un área para dormir y comer.
        7. El adoptado recibirá los cuidados médicos necesarios para su bienestar (desparasitación cada 6 meses y vacunación anual).
        8. El adoptado será esterilizado de no estarlo.
        9. SI NO SE CUMPLIERA CON LO INDICADO, EL ADOPTADO SERÁ RETIRADO INMEDIATAMENTE (SE LE OFRECE UN HOGAR DE AMOR Y PROTECCIÓN)
        
        ACEPTO CONDICIONES					




        Firma

        Nombre completo:
        CC:


        ENTREGO EN ADOPCIÓN




        Firma

        Nombre completo:
        CC:"
    end

    # def line_items
    #     move_down 50
    #     text "Location: #{@current_user[:id]}"
    #     move_down 15
    #     text "Type: #{@adopter_user[:id]}"
    # end
end