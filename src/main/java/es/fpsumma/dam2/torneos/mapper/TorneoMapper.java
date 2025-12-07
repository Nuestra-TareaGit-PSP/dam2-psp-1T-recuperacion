package es.fpsumma.dam2.torneos.mapper;

import es.fpsumma.dam2.torneos.dto.response.TorneoResponse;
import es.fpsumma.dam2.torneos.dto.response.TorneoResumenResponse;
import es.fpsumma.dam2.torneos.jpa.entity.TorneoEntity;

public class TorneoMapper {

    public static TorneoResumenResponse torneoEntityToTorneoResumenResponse(TorneoEntity e) {
        return new TorneoResumenResponse(e.getId(), e.getNombre(), e.getJuego());
    }

    public static TorneoResponse torneoEntityToTorneoResponse(TorneoEntity e) {
        return null;
    }
}
