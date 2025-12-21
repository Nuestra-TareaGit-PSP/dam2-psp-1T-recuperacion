package es.fpsumma.dam2.torneos.jpa.entity;

import jakarta.persistence.*;

//ahora creo la entidad ParticipanteEntity con la relación "ManyToOne" hacia TorneoEntity

@Entity
@Table(name = "participantes")
public class ParticipanteEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String nombre;

    @Column(nullable = false, length = 150)
    private String apellidos;

    @Column(nullable = false, length = 50)
    private String pais;

    private Integer edad;

    @ManyToOne
    @JoinColumn(name = "torneo_id", nullable = false)
    private TorneoEntity torneo;

    public ParticipanteEntity() {
    }

    public ParticipanteEntity(Long id, String nombre, String apellidos, String pais, Integer edad, TorneoEntity torneo) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.pais = pais;
        this.edad = edad;
        this.torneo = torneo; //añado la relación necesaria de torneo
    }

    //Getters y Setters
    public Long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }
    
    public String getPais() {
        return pais;
    }

    public Integer getEdad() {
        return edad;
    }

    public TorneoEntity getTorneo() {
        return torneo;
    }

    public void setTorneo(TorneoEntity torneo) {
        this.torneo = torneo;
    }
}