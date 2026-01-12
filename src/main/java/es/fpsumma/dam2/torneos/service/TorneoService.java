package es.fpsumma.dam2.torneos.service;

import java.util.List;

import es.fpsumma.dam2.torneos.dto.request.TorneoRequest;
import es.fpsumma.dam2.torneos.dto.response.ParticipanteResponse;
import es.fpsumma.dam2.torneos.dto.response.TorneoResponse;
import es.fpsumma.dam2.torneos.dto.response.TorneoResumenResponse;

//actualizo la interfaz TorneoService para incluir los nuevos métodos relacionados con participantes

public interface TorneoService {
    List<TorneoResumenResponse> listarTorneos(String ordenarPor, String direccion);

    TorneoResponse getTorneo(Long id);

    TorneoResponse crearTorneo(TorneoRequest request);

    TorneoResponse actualizarTorneo(Long id, TorneoRequest request);

    void eliminarTorneo(Long id);
    
    List<ParticipanteResponse> listarParticipantes(Long torneoId);
}
