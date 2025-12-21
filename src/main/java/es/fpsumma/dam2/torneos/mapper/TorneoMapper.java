package es.fpsumma.dam2.torneos.mapper;

import es.fpsumma.dam2.torneos.dto.response.TorneoResponse;
import es.fpsumma.dam2.torneos.dto.response.TorneoResumenResponse;
import es.fpsumma.dam2.torneos.jpa.entity.TorneoEntity;

//ahora actualizo el mapper para que incluya el nuevo campo "inscritos" en el TorneoResponse

public class TorneoMapper {

    public static TorneoResumenResponse torneoEntityToTorneoResumenResponse(TorneoEntity e) {
        return new TorneoResumenResponse(e.getId(), e.getNombre(), e.getJuego());
    }

    public static TorneoResponse torneoEntityToTorneoResponse(TorneoEntity e) {
        //este es el cálculo del precio con el símbolo €
        String precioFormateado = (e.getPrecio() != null) ? String.format("%.2f €", e.getPrecio()) : "0.00 €";
        
        //este es el conteo de la lista de participantes
        int inscritos = (e.getParticipantes() != null) ? e.getParticipantes().size() : 0;

        return new TorneoResponse(
                e.getId(),
                e.getNombre(),
                e.getJuego(),
                e.getDuracionEnMinutos(),
                inscritos, //aquí paso el conteo real
                precioFormateado
        );
    }
}