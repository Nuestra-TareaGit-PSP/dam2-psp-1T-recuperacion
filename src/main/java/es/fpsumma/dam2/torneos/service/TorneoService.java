package es.fpsumma.dam2.torneos.service;

import es.fpsumma.dam2.torneos.dto.response.TorneoResponse;
import es.fpsumma.dam2.torneos.dto.response.TorneoResumenResponse;

import java.util.List;

//actualizo la interfaz TorneoService para incluir los nuevos métodos relacionados con participantes

public interface TorneoService {
    List<TorneoResumenResponse> listarTorneos(String ordenarPor, String direccion);

    TorneoResponse getTorneo(Long id);

    TorneoResponse crearTorneo(TorneoRequest request);

    TorneoResponse actualizarTorneo(Long id, TorneoRequest request);

    void eliminarTorneo(Long id);
    
    List<ParticipanteResponse> listarParticipantes(Long torneoId);
}
