package es.fpsumma.dam2.torneos.service.impl;

import es.fpsumma.dam2.torneos.dto.response.TorneoResponse;
import es.fpsumma.dam2.torneos.dto.response.TorneoResumenResponse;
import es.fpsumma.dam2.torneos.jpa.repository.TorneoRepository;
import es.fpsumma.dam2.torneos.service.TorneoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TorneoServiceImpl implements TorneoService {

    private final TorneoRepository torneoRepository;

    @Autowired
    public TorneoServiceImpl(TorneoRepository torneoRepository) {
        this.torneoRepository = torneoRepository;
    }

    @Override
    public List<TorneoResumenResponse> listarTorneos(String ordenarPor, String direccion) {

        return List.of();
    }

    @Override
    public TorneoResponse getTorneo(Long id) {
        return null;
    }


}
