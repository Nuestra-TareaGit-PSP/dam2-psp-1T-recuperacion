package es.fpsumma.dam2.torneos.web.controller;

import es.fpsumma.dam2.torneos.dto.request.TorneoRequest;
import es.fpsumma.dam2.torneos.dto.response.TorneoResponse;
import es.fpsumma.dam2.torneos.dto.response.TorneoResumenResponse;
import es.fpsumma.dam2.torneos.service.TorneoService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class TorneoController {

    private final TorneoService torneoService;

    @Autowired
    public TorneoController(TorneoService torneoService) {
        this.torneoService = torneoService;
    }

    public List<TorneoResumenResponse> getTorneos(@RequestParam(defaultValue = "id") String ordenarPor,
                                                  String direccion) {
        return null;
    }

    public TorneoResponse getTorneo(@PathVariable Long id) {
        return null;
    }

    public TorneoResponse crearTorneo(@Valid @RequestBody TorneoRequest request) {
        return null;
    }

}
