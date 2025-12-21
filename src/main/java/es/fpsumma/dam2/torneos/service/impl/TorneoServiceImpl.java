package es.fpsumma.dam2.torneos.service.impl;

import es.fpsumma.dam2.torneos.dto.response.TorneoResponse;
import es.fpsumma.dam2.torneos.dto.response.TorneoResumenResponse;
import es.fpsumma.dam2.torneos.jpa.repository.TorneoRepository;
import es.fpsumma.dam2.torneos.service.TorneoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//actualizo la implementación del servicio TorneoServiceImpl, completando los métodos 
//y para incluir los nuevos métodos y lógica relacionados con participantes

@Service
public class TorneoServiceImpl implements TorneoService {

    private final TorneoRepository torneoRepository;

    @Autowired
    public TorneoServiceImpl(TorneoRepository torneoRepository) {
        this.torneoRepository = torneoRepository;
    }

    //edito el método listarTorneos para validar los parámetros de ordenación
    @Override
    public List<TorneoResumenResponse> listarTorneos(String ordenarPor, String direccion) {
        //validación 1: lista de campos permitidos según la rúbrica
        List<String> camposValidos = List.of("id", "nombre", "juego", "duracionEnMinutos", "precio");
        
        //validación 2: si el campo no es válido, usamos el valor por defecto: "nombre"
        String campoFinal = camposValidos.contains(ordenarPor) ? ordenarPor : "nombre";
        
        //validación 3: si la dirección no es asc o desc, usamos "asc"
        Sort.Direction dirFinal = direccion.equalsIgnoreCase("desc") ? Sort.Direction.DESC : Sort.Direction.ASC;

        Sort sort = Sort.by(dirFinal, campoFinal);
        return torneoRepository.findAll(sort).stream()
                .map(TorneoMapper::torneoEntityToTorneoResumenResponse)
                .toList();
    }

    @Override
    public TorneoResponse getTorneo(Long id) {
        return torneoRepository.findById(id)
                .map(TorneoMapper::torneoEntityToTorneoResponse)
                .orElseThrow(() -> new TorneoNoEncontradoException("Torneo con ID " + id + " no encontrado"));
    }

    @Override
    public TorneoResponse crearTorneo(TorneoRequest request) {
        TorneoEntity entity = new TorneoEntity();
        entity.setNombre(request.nombre());
        entity.setJuego(request.juego());
        entity.setDuracionEnMinutos(request.duracionEnMinutos());
        entity.setPrecio(request.precio());
        return TorneoMapper.torneoEntityToTorneoResponse(torneoRepository.save(entity));
    }

    //ahora creo los métodos actualizar, eliminar y listarParticipantes
    @Override
    public TorneoResponse actualizarTorneo(Long id, TorneoRequest request) {
        //Paso 1 - validación: verificar si existe, si no: 404
        TorneoEntity entity = torneoRepository.findById(id)
                .orElseThrow(() -> new TorneoNoEncontradoException("Torneo no encontrado con id: " + id));
        
        //Paso 2 - actualizar campos
        entity.setNombre(request.nombre());
        entity.setJuego(request.juego());
        entity.setDuracionEnMinutos(request.duracionEnMinutos());
        entity.setPrecio(request.precio());
        
        //Paso 2 - Guardar y devolver DTO
        return TorneoMapper.torneoEntityToTorneoResponse(torneoRepository.save(entity));
    }

    //actualizo el método eliminarTorneo para manejar el caso en que el torneo no exista
    @Override
    public void eliminarTorneo(Long id) {
        if (!torneoRepository.existsById(id)) {
            throw new TorneoNoEncontradoException("No se puede eliminar: el torneo no existe.");
        }
        torneoRepository.deleteById(id);
    }

    @Override
    public List<ParticipanteResponse> listarParticipantes(Long torneoId) {
        if (!torneoRepository.existsById(torneoId)) {
            throw new TorneoNoEncontradoException("Torneo no encontrado");
        }
        return participanteRepository.findByTorneoId(torneoId).stream()
                .map(ParticipanteMapper::toResponse)
                .toList();
    }
    
}
