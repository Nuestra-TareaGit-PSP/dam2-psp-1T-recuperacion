package es.fpsumma.dam2.torneos.jpa.repository;

import es.fpsumma.dam2.torneos.jpa.entity.ParticipanteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

//creo el repositorio ParticipanteRepository con el método para buscar participantes por el id del torneo

public interface ParticipanteRepository extends JpaRepository<ParticipanteEntity, Long> {
    List<ParticipanteEntity> findByTorneoId(Long torneoId);
}