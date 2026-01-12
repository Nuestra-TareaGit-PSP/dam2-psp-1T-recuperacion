package es.fpsumma.dam2.torneos.jpa.entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "torneos")
public class TorneoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;

    private String juego;
    @Column(name = "duracion")
    private Integer duracionEnMinutos;

    private Double precio;

    //lo primero que tenemos que añadir para que pueda funcionar la relación
    @OneToMany(mappedBy = "torneo", cascade = CascadeType.ALL)
    private List<ParticipanteEntity> participantes;

    //actualizo el setter de juego
    public void setJuego(String juego) {
        this.juego = juego;
    }

    public TorneoEntity() {
    }

    public TorneoEntity(Long id, String nombre, String juego, Integer duracionEnMinutos, Double precio) {
    this.id = id;
    this.nombre = nombre;
    this.juego = juego; //antes decía 'ciudad', lo edito para que coincida con el atributo
    this.duracionEnMinutos = duracionEnMinutos;
    this.precio = precio;
}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String titulo) {
        this.nombre = titulo;
    }

    public String getJuego() {
        return juego;
    }

    public Integer getDuracionEnMinutos() {
        return duracionEnMinutos;
    }

    public void setDuracionEnMinutos(Integer duracionEnMinutos) {
        this.duracionEnMinutos = duracionEnMinutos;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public List<ParticipanteEntity> getParticipantes() {
        return participantes;
    }
}