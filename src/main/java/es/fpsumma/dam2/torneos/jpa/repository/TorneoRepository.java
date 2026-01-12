package es.fpsumma.dam2.torneos.jpa.repository;

import es.fpsumma.dam2.torneos.jpa.entity.TorneoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TorneoRepository extends JpaRepository<TorneoEntity, Long> {}
