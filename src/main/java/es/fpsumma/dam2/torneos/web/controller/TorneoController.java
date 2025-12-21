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

    //actualizo el controlador TorneoController para incluir los endpoints completos relacionados con participantes

    @GetMapping("/torneos")
    public List<TorneoResumenResponse> getTorneos(
            @RequestParam(defaultValue = "nombre") String ordenarPor,
            @RequestParam(defaultValue = "asc") String direccion) {
        return torneoService.listarTorneos(ordenarPor, direccion);
    }

    @GetMapping("/torneos/{id}")
    public TorneoResponse getTorneo(@PathVariable Long id) {
        return torneoService.getTorneo(id);
    }

    @PostMapping("/torneos")
    @ResponseStatus(HttpStatus.CREATED)
    public TorneoResponse crearTorneo(@Valid @RequestBody TorneoRequest request) {
        return torneoService.crearTorneo(request);
    }

    @PutMapping("/torneos/{id}")
    public TorneoResponse actualizarTorneo(@PathVariable Long id, @Valid @RequestBody TorneoRequest request) {
        return torneoService.actualizarTorneo(id, request);
    }

    @DeleteMapping("/torneos/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void eliminarTorneo(@PathVariable Long id) {
        torneoService.eliminarTorneo(id);
    }

    //añado el endpoint para listar participantes de un torneo
    @GetMapping("/torneos/{id}/participantes")
    public List<ParticipanteResponse> getParticipantes(@PathVariable Long id) {
        return torneoService.listarParticipantes(id);
    }

}
