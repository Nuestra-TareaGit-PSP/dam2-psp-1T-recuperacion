package es.fpsumma.dam2.torneos.service;

import es.fpsumma.dam2.torneos.dto.response.TorneoResponse;
import es.fpsumma.dam2.torneos.dto.response.TorneoResumenResponse;

import java.util.List;


public interface TorneoService {

    public List<TorneoResumenResponse> listarTorneos(String ordenarPor, String direccion);

    TorneoResponse getTorneo(Long id);


}
