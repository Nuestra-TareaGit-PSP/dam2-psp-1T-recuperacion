-- =========================================
-- 1. Borrar tablas si existen
-- =========================================
DROP TABLE IF EXISTS participantes;
DROP TABLE IF EXISTS torneos;

-- =========================================
-- 2. Crear tabla TORNEOS
-- =========================================
CREATE TABLE torneos
(
    id       BIGSERIAL PRIMARY KEY,
    nombre   VARCHAR(255) NOT NULL,
    juego    VARCHAR(100) NOT NULL,
    duracion INTEGER,          -- duracionEnMinutos
    precio   NUMERIC(10, 2)
);

-- =========================================
-- 3. Insertar 30 registros en TORNEOS
-- =========================================
INSERT INTO torneos (nombre, juego, duracion, precio)
VALUES
    ('Torneo 2v2 Rocket League - Novatos', 'Rocket League', 120, 0.00),
    ('Liga Valorant - Bronce a Oro', 'Valorant', 180, 5.00),
    ('ARAM Night - Solo por diversión', 'League of Legends', 90, 0.00),
    ('Torneo EA SPORTS FC - Eliminatoria', 'EA SPORTS FC', 120, 3.50),
    ('CS2 - Mini Cup de 16 equipos', 'Counter-Strike 2', 240, 8.00),
    ('Fortnite - Dúos rápido', 'Fortnite', 150, 4.00),
    ('Minecraft - Build Battle', 'Minecraft', 120, 0.00),
    ('Mario Kart - Time Trial', 'Mario Kart', 90, 2.00),
    ('Brawl Stars - 3v3', 'Brawl Stars', 120, 1.50),
    ('Clash Royale - Challenge', 'Clash Royale', 90, 1.00),
    ('Apex Legends - Trios', 'Apex Legends', 180, 4.50),
    ('Overwatch 2 - Quick Cup', 'Overwatch 2', 150, 4.00),
    ('Tekken - Bracket 1v1', 'Tekken', 120, 3.00),
    ('Street Fighter - Bracket 1v1', 'Street Fighter', 120, 3.00),
    ('Smash Bros - 1v1', 'Super Smash Bros', 150, 4.00),
    ('Fall Guys - Knockout', 'Fall Guys', 90, 0.00),
    ('Among Us - Partidas organizadas', 'Among Us', 90, 0.00),
    ('Hearthstone - Bo3', 'Hearthstone', 120, 2.50),
    ('TFT - Lobby', 'TFT', 120, 2.00),
    ('Pokémon Unite - 5v5', 'Pokémon Unite', 120, 2.00),
    ('GeoGuessr - Duelo', 'GeoGuessr', 90, 1.50),
    ('Ajedrez - Blitz', 'Ajedrez', 120, 1.00),
    ('Forza - Racing Cup', 'Forza Horizon', 120, 3.00),
    ('F1 - Time Attack', 'F1', 90, 2.50),
    ('Wild Rift - Mobile Cup', 'Wild Rift', 150, 3.00),
    ('PUBG Mobile - Squad', 'PUBG Mobile', 180, 4.00),
    ('Rocket League - Avanzado', 'Rocket League', 180, 6.00),
    ('Valorant - Avanzado', 'Valorant', 240, 10.00),
    ('League of Legends - Draft Cup', 'League of Legends', 180, 5.00),
    ('Minecraft - Speedrun reto', 'Minecraft', 120, 0.00);

-- =========================================
-- 4. Crear tabla PARTICIPANTES
-- =========================================
CREATE TABLE participantes
(
    id        BIGSERIAL PRIMARY KEY,
    nombre    VARCHAR(100) NOT NULL,
    apellidos VARCHAR(150) NOT NULL,
    pais      VARCHAR(50)  NOT NULL,
    edad      INTEGER,
    torneo_id BIGINT       NOT NULL REFERENCES torneos (id) ON DELETE CASCADE
);
-- =========================================
-- 5. Insertar PARTICIPANTES (10 por TORNEO, datos fijos)
-- =========================================
INSERT INTO participantes (nombre, apellidos, pais, edad, torneo_id)
VALUES
-- Excursión 1 (id = 1)
('Carlos', 'García López', 'España', 28, 1),
('Ana', 'Martínez Ruiz', 'España', 34, 1),
('Javier', 'Santos Gil', 'México', 41, 1),
('Lucía', 'Navarro Torres', 'Argentina', 23, 1),
('Miguel', 'Ortega Fernández', 'Chile', 37, 1),
('Laura', 'Suárez Morales', 'Colombia', 29, 1),
('Sergio', 'Castro Romero', 'España', 45, 1),
('Patricia', 'Vega Hernández', 'Perú', 31, 1),
('David', 'Domínguez Pérez', 'España', 52, 1),
('Elena', 'Campos Serrano', 'Uruguay', 27, 1),

-- Excursión 2 (id = 2)
('Raúl', 'Jiménez Martín', 'España', 33, 2),
('Marta', 'López Delgado', 'España', 26, 2),
('Hugo', 'Ramos Castillo', 'Francia', 39, 2),
('Noelia', 'Gómez Sánchez', 'Italia', 22, 2),
('Iván', 'Corrales Solera', 'España', 40, 2),
('Beatriz', 'Rivas Cordero', 'Portugal', 35, 2),
('Adrián', 'Pascual Núñez', 'España', 48, 2),
('Clara', 'Rey Aguado', 'Alemania', 30, 2),
('Pablo', 'Molina Arroyo', 'España', 54, 2),
('Sara', 'Fuentes León', 'Reino Unido', 29, 2),

-- Excursión 3 (id = 3)
('José', 'Fernández Díaz', 'España', 57, 3),
('Natalia', 'Prieto Cano', 'España', 24, 3),
('Tomás', 'Romero Iglesias', 'Brasil', 36, 3),
('Paula', 'Silva Herrera', 'España', 21, 3),
('Diego', 'Cortés Benítez', 'Chile', 43, 3),
('Irene', 'Rubio Sancho', 'España', 32, 3),
('Óscar', 'Lara Flores', 'Argentina', 50, 3),
('Eva', 'Pérez Alonso', 'España', 27, 3),
('Manuel', 'Santos Ramírez', 'Colombia', 60, 3),
('Rocío', 'Nieto Cabrera', 'España', 25, 3),

-- Excursión 4 (id = 4)
('Alberto', 'Vázquez Mena', 'España', 38, 4),
('Nuria', 'Delgado Rubio', 'España', 33, 4),
('Jorge', 'Gallardo Rey', 'Alemania', 49, 4),
('Elisa', 'Morales Pardo', 'España', 20, 4),
('Felipe', 'Campos Lozano', 'Portugal', 44, 4),
('Celia', 'Herrera Santos', 'España', 28, 4),
('Rubén', 'Padilla Crespo', 'Francia', 52, 4),
('Andrea', 'Juárez Varela', 'España', 31, 4),
('Marcos', 'León Gil', 'Italia', 23, 4),
('Alicia', 'Méndez Bravo', 'España', 47, 4),

-- Excursión 5 (id = 5)
('Gabriel', 'Roldán Cuevas', 'España', 35, 5),
('Noemí', 'Carrasco Peña', 'España', 26, 5),
('Samuel', 'Esteban Aguilar', 'Estados Unidos', 40, 5),
('Helena', 'Varela Rubio', 'España', 22, 5),
('Víctor', 'Sáez Robles', 'Canadá', 55, 5),
('Julia', 'Duarte Solís', 'España', 29, 5),
('Ignacio', 'Calvo Lázaro', 'Portugal', 42, 5),
('Pilar', 'Montoro Ibáñez', 'España', 37, 5),
('Raquel', 'Escribano Vera', 'México', 34, 5),
('Héctor', 'Benito Lozano', 'España', 48, 5),

-- Excursión 6 (id = 6)
('Luis', 'Gómez Herrero', 'España', 63, 6),
('Teresa', 'Román Castaño', 'España', 27, 6),
('Andrés', 'Pineda Soto', 'Argentina', 31, 6),
('Sofía', 'Iglesias Mora', 'España', 19, 6),
('Fernando', 'Marín Carreño', 'Chile', 46, 6),
('Olga', 'Rico Salas', 'España', 39, 6),
('Ismael', 'Solano Vicente', 'Colombia', 52, 6),
('Cristina', 'Luque Campos', 'España', 24, 6),
('Julián', 'Sierra Cobo', 'España', 58, 6),
('Lorena', 'Caballero Luna', 'Perú', 33, 6),

-- Excursión 7 (id = 7)
('Víctor', 'Aranda Ceballos', 'España', 44, 7),
('Claudia', 'Gil Pacheco', 'España', 25, 7),
('Álvaro', 'Serrano Ros', 'Reino Unido', 37, 7),
('Inés', 'Acosta Bravo', 'España', 23, 7),
('Gonzalo', 'Miranda Ríos', 'Italia', 49, 7),
('Lidia', 'Mateo Lozano', 'España', 41, 7),
('Joaquín', 'Peña Arroyo', 'Francia', 54, 7),
('Belén', 'Luna Medina', 'España', 29, 7),
('Esteban', 'Santos Vidal', 'Portugal', 62, 7),
('Mónica', 'Polo Hidalgo', 'España', 38, 7),

-- Excursión 8 (id = 8)
('Santiago', 'Rey Ortega', 'España', 56, 8),
('Iris', 'Cano Vázquez', 'España', 21, 8),
('Cristian', 'Bravo Molina', 'México', 32, 8),
('Daniela', 'López Téllez', 'España', 24, 8),
('Mauricio', 'Ferrer Rubio', 'Chile', 45, 8),
('Nerea', 'Hernández Sosa', 'España', 30, 8),
('Rodrigo', 'Arenas Moya', 'Argentina', 53, 8),
('Alba', 'Quintana Rueda', 'España', 27, 8),
('Gerardo', 'Navarro Soriano', 'Colombia', 61, 8),
('Yolanda', 'Vargas Peña', 'España', 36, 8),

-- Excursión 9 (id = 9)
('Emilio', 'Suárez Vidal', 'España', 59, 9),
('Candela', 'Moreno Pardo', 'España', 20, 9),
('Mariano', 'Correa Pascual', 'Brasil', 47, 9),
('Ainhoa', 'Del Valle Cruz', 'España', 23, 9),
('Federico', 'Lagos Prieto', 'Perú', 43, 9),
('Silvia', 'Gallego Rico', 'España', 31, 9),
('Ricardo', 'Soto Molina', 'Chile', 51, 9),
('Noa', 'Arroyo Cid', 'España', 26, 9),
('Bruno', 'Franco Oliva', 'España', 65, 9),
('Marina', 'Santos Tejada', 'Argentina', 34, 9),

-- Excursión 10 (id = 10)
('Jaime', 'Pérez Castañeda', 'España', 46, 10),
('Laura', 'Romero Tejero', 'España', 28, 10),
('Cristóbal', 'Sánchez Álvarez', 'Colombia', 39, 10),
('Iria', 'Crespo Dávila', 'España', 22, 10),
('Raúl', 'Calderón Montes', 'Italia', 55, 10),
('Carla', 'Segura Paredes', 'España', 33, 10),
('Nicolás', 'Vidal Lozano', 'Francia', 44, 10),
('Vera', 'Marcos Navas', 'España', 25, 10),
('Darío', 'Valero Sanz', 'Portugal', 60, 10),
('Olivia', 'Campos Herrera', 'España', 27, 10),

-- Excursión 11 (id = 11)
('Hugo', 'Ramos Herrera', 'España', 29, 11),
('Sonia', 'Requena Blanco', 'España', 24, 11),
('Mateo', 'Del Río Santos', 'Argentina', 42, 11),
('Naiara', 'Benítez Roldán', 'España', 19, 11),
('Adolfo', 'Sevilla Moya', 'México', 58, 11),
('Judith', 'Alonso Serrat', 'España', 35, 11),
('Hernán', 'Valencia Rivas', 'Chile', 49, 11),
('Águeda', 'Paz Ortega', 'España', 31, 11),
('Mario', 'Ibáñez Corrales', 'España', 52, 11),
('Nora', 'Salazar Vela', 'Perú', 39, 11),

-- Excursión 12 (id = 12)
('Tomás', 'de la Fuente Gil', 'España', 41, 12),
('Elena', 'Peñalver Ríos', 'España', 23, 12),
('Julián', 'Muñoz Ferrer', 'Italia', 57, 12),
('Celia', 'Reyes Camacho', 'España', 26, 12),
('Ramiro', 'Velasco Pons', 'Francia', 46, 12),
('Lola', 'Carrión Rubio', 'España', 33, 12),
('Sergi', 'Nadal Riera', 'Portugal', 38, 12),
('Patri', 'López Corrales', 'España', 29, 12),
('Álvaro', 'Solís Mínguez', 'España', 61, 12),
('Iria', 'Mata Romano', 'Alemania', 37, 12),

-- Excursión 13 (id = 13)
('Pablo', 'Santos Gálvez', 'España', 48, 13),
('Raquel', 'Costa Mora', 'España', 27, 13),
('Fabián', 'Castillo León', 'Argentina', 43, 13),
('Lucía', 'Guerrero Sáez', 'España', 22, 13),
('Enrique', 'Simón Robredo', 'Chile', 59, 13),
('Nerea', 'Aranda Cano', 'España', 30, 13),
('Jorge', 'Gil Herrera', 'Brasil', 36, 13),
('Paula', 'Vera Alonso', 'España', 24, 13),
('Óscar', 'Soria Plaza', 'España', 53, 13),
('Marta', 'del Olmo Aguado', 'Colombia', 40, 13),

-- Excursión 14 (id = 14)
('Rafael', 'Pizarro Mena', 'España', 64, 14),
('Ainhoa', 'Calero Abril', 'España', 21, 14),
('Hernán', 'Téllez Pardo', 'México', 38, 14),
('Patricia', 'Leiva Montero', 'España', 25, 14),
('Fermín', 'Bautista Vivas', 'Perú', 49, 14),
('Gloria', 'Redondo Soto', 'España', 34, 14),
('Alonso', 'del Valle Márquez', 'Chile', 51, 14),
('Noelia', 'Arévalo Campos', 'España', 29, 14),
('Isidro', 'Cuevas Jurado', 'España', 72, 14),
('Silvia', 'Romero Llamas', 'Argentina', 44, 14),

-- Excursión 15 (id = 15)
('Germán', 'Rubio Crespo', 'España', 39, 15),
('Lucía', 'Sanchis Mora', 'España', 24, 15),
('Nicolás', 'Arcos Ríos', 'Italia', 47, 15),
('Elisa', 'Rico Lozano', 'España', 22, 15),
('Bruno', 'Martín Barrios', 'Francia', 52, 15),
('Carolina', 'Pardo Nieto', 'España', 31, 15),
('Joel', 'Garrido Lázaro', 'Portugal', 44, 15),
('Diana', 'Alba Soto', 'España', 26, 15),
('Israel', 'Manzano Rico', 'España', 57, 15),
('Teresa', 'Osorio Maldonado', 'Alemania', 37, 15),

-- Excursión 16 (id = 16)
('Julio', 'Corral Serrano', 'España', 60, 16),
('Miriam', 'Cano Iglesias', 'España', 28, 16),
('Leandro', 'Godoy Vera', 'Argentina', 35, 16),
('Rosa', 'Calvo Alba', 'España', 23, 16),
('Manuel', 'Segovia Campos', 'Chile', 50, 16),
('Naiara', 'Moreno Pino', 'España', 32, 16),
('Pedro', 'Palacios Vela', 'México', 43, 16),
('Laia', 'Font Rovira', 'España', 27, 16),
('Rubén', 'Carrillo Sanz', 'España', 55, 16),
('Olga', 'Prado Montes', 'Colombia', 41, 16),

-- Excursión 17 (id = 17)
('Iván', 'Garrido Soler', 'España', 33, 17),
('Sandra', 'Vidal Montero', 'España', 25, 17),
('Tomás', 'Soto Lobo', 'Brasil', 46, 17),
('Clara', 'Salas Núñez', 'España', 20, 17),
('Gerardo', 'Lago Corrales', 'Perú', 58, 17),
('Mónica', 'Espejo Díaz', 'España', 36, 17),
('Héctor', 'Rubio Solís', 'Chile', 49, 17),
('Noa', 'Pérez Lozano', 'España', 21, 17),
('Jaime', 'Galán Serrat', 'España', 63, 17),
('Lara', 'Santos Cuenca', 'Argentina', 42, 17),

-- Excursión 18 (id = 18)
('Alfredo', 'Pino Durán', 'España', 37, 18),
('Esther', 'Cortés Alarcón', 'España', 26, 18),
('Rodrigo', 'Sosa Villar', 'México', 48, 18),
('Ruth', 'Lafuente Soria', 'España', 22, 18),
('Manu', 'Nieto Guzmán', 'Chile', 52, 18),
('Irene', 'Salinas Godoy', 'España', 30, 18),
('Ángel', 'Solé Castell', 'Argentina', 39, 18),
('Blanca', 'Cueto Lozano', 'España', 27, 18),
('Jon', 'Zabala Mendizábal', 'España', 45, 18),
('Núria', 'Ribas Martí', 'Portugal', 34, 18),

-- Excursión 19 (id = 19)
('Pere', 'Serra Bosch', 'España', 41, 19),
('Laia', 'Valls Pujol', 'España', 24, 19),
('Marcelo', 'Costa Farias', 'Brasil', 53, 19),
('Mireia', 'Roca Segarra', 'España', 21, 19),
('Xavier', 'Sala Casals', 'Francia', 46, 19),
('Neus', 'Besalú Ortís', 'España', 33, 19),
('Ferran', 'Climent Rius', 'Italia', 56, 19),
('Gemma', 'Morera Solé', 'España', 28, 19),
('Arnau', 'Bruc Teixidor', 'España', 62, 19),
('Aina', 'Planells Riera', 'Portugal', 35, 19),

-- Excursión 20 (id = 20)
('Enzo', 'López Cardoso', 'Argentina', 29, 20),
('Camila', 'Suárez Romero', 'Argentina', 23, 20),
('Mateo', 'Giménez Torres', 'España', 38, 20),
('Valentina', 'Ríos Figueroa', 'Chile', 27, 20),
('Thiago', 'Paz Godoy', 'Brasil', 44, 20),
('Luciana', 'Vega Ochoa', 'México', 32, 20),
('Benjamín', 'Herrera Soto', 'Colombia', 41, 20),
('Isabella', 'Pineda Cruz', 'Perú', 26, 20),
('Joaquín', 'Navarro Díaz', 'España', 48, 20),
('Martina', 'Cano Flores', 'España', 22, 20),

-- Excursión 21 (id = 21)
('Diego', 'Lara Rivas', 'España', 36, 21),
('Adela', 'Frías Campos', 'España', 31, 21),
('Kevin', 'Rodríguez Smith', 'Estados Unidos', 40, 21),
('Emma', 'Johnson García', 'Estados Unidos', 25, 21),
('Liam', 'Williams Pérez', 'Reino Unido', 39, 21),
('Olivia', 'Brown Sánchez', 'Reino Unido', 28, 21),
('Noah', 'Davis Romero', 'Canadá', 34, 21),
('Ava', 'Miller Rubio', 'Canadá', 26, 21),
('Ethan', 'Wilson Herrera', 'Australia', 42, 21),
('Sophia', 'Taylor Iglesias', 'Australia', 30, 21),

-- Excursión 22 (id = 22)
('Rui', 'Silva Costa', 'Portugal', 47, 22),
('Ana', 'Pereira Lopes', 'Portugal', 29, 22),
('João', 'Fernandes Pinto', 'Portugal', 38, 22),
('Mariana', 'Carvalho Dias', 'Portugal', 24, 22),
('Tiago', 'Gonçalves Rocha', 'Portugal', 52, 22),
('Beatriz', 'Rodrigues Sousa', 'Portugal', 33, 22),
('Miguel', 'Oliveira Martins', 'Portugal', 41, 22),
('Inês', 'Santos Faria', 'Portugal', 27, 22),
('Pedro', 'Nunes Moreira', 'Portugal', 49, 22),
('Sofia', 'Teixeira Neves', 'Portugal', 23, 22),

-- Excursión 23 (id = 23)
('Hans', 'Müller Schmidt', 'Alemania', 50, 23),
('Anna', 'Schneider Braun', 'Alemania', 35, 23),
('Lukas', 'Wagner Becker', 'Alemania', 29, 23),
('Mia', 'Fischer Zimmermann', 'Alemania', 24, 23),
('Jonas', 'Weber Koch', 'Alemania', 44, 23),
('Lea', 'Hoffmann Richter', 'Alemania', 31, 23),
('Felix', 'Schäfer Klein', 'Alemania', 39, 23),
('Lena', 'Bauer Wolf', 'Alemania', 27, 23),
('Paul', 'Krause Schmitz', 'Alemania', 56, 23),
('Laura', 'Hartmann Vogel', 'Alemania', 33, 23),

-- Excursión 24 (id = 24)
('Marco', 'Rossi Bianchi', 'Italia', 42, 24),
('Giulia', 'Russo Greco', 'Italia', 26, 24),
('Luca', 'Ferrari Conti', 'Italia', 37, 24),
('Sofia', 'Esposito Galli', 'Italia', 23, 24),
('Matteo', 'Ricci Costa', 'Italia', 49, 24),
('Chiara', 'Marino Fabbri', 'Italia', 34, 24),
('Alessandro', 'Lombardi Riva', 'Italia', 39, 24),
('Francesca', 'Gatti Bernardi', 'Italia', 28, 24),
('Federico', 'Colombo Serra', 'Italia', 53, 24),
('Elena', 'Giordano Fontana', 'Italia', 31, 24),

-- Excursión 25 (id = 25)
('Jean', 'Dupont Martin', 'Francia', 45, 25),
('Marie', 'Lefevre Bernard', 'Francia', 29, 25),
('Pierre', 'Moreau Petit', 'Francia', 38, 25),
('Camille', 'Girard Garnier', 'Francia', 24, 25),
('Luc', 'Laurent Robert', 'Francia', 51, 25),
('Chloé', 'David Mathieu', 'Francia', 33, 25),
('Hugo', 'Richard Faure', 'Francia', 40, 25),
('Manon', 'Roche Vincent', 'Francia', 27, 25),
('Antoine', 'Muller Henry', 'Francia', 57, 25),
('Juliette', 'Blanc Renaud', 'Francia', 32, 25),

-- Excursión 26 (id = 26)
('Tiago', 'Araújo Silva', 'Brasil', 36, 26),
('Larissa', 'Carvalho Lima', 'Brasil', 25, 26),
('Rafael', 'Oliveira Souza', 'Brasil', 41, 26),
('Bruna', 'Costa Almeida', 'Brasil', 23, 26),
('Gustavo', 'Pereira Gomes', 'Brasil', 49, 26),
('Isabela', 'Rodrigues Melo', 'Brasil', 30, 26),
('Felipe', 'Barbosa Rocha', 'Brasil', 39, 26),
('Ana', 'Fernandes Nogueira', 'Brasil', 27, 26),
('Lucas', 'Lopes Batista', 'Brasil', 52, 26),
('Mariana', 'Ribeiro Duarte', 'Brasil', 31, 26),

-- Excursión 27 (id = 27)
('George', 'Smith Johnson', 'Estados Unidos', 43, 27),
('Emily', 'Williams Brown', 'Estados Unidos', 29, 27),
('Michael', 'Jones Miller', 'Estados Unidos', 38, 27),
('Ashley', 'Davis Wilson', 'Estados Unidos', 24, 27),
('Daniel', 'Moore Taylor', 'Estados Unidos', 47, 27),
('Madison', 'Anderson Thomas', 'Estados Unidos', 32, 27),
('Christopher', 'Jackson White', 'Estados Unidos', 40, 27),
('Abigail', 'Harris Martin', 'Estados Unidos', 26, 27),
('Joshua', 'Thompson Garcia', 'Estados Unidos', 51, 27),
('Natalie', 'Martinez Robinson', 'Estados Unidos', 34, 27),

-- Excursión 28 (id = 28)
('Ahmed', 'Hassan Ali', 'Marruecos', 39, 28),
('Amina', 'Bennani Zahra', 'Marruecos', 27, 28),
('Youssef', 'El Fassi Idrissi', 'Marruecos', 35, 28),
('Sara', 'El Mansouri Nasser', 'Marruecos', 24, 28),
('Omar', 'Lahlou El Alaoui', 'Marruecos', 48, 28),
('Fatima', 'Cheikh El Yousfi', 'Marruecos', 31, 28),
('Rachid', 'Toumi Bakkali', 'Marruecos', 44, 28),
('Laila', 'Khalil Idrissi', 'Marruecos', 25, 28),
('Hicham', 'Ben Ali Amrani', 'Marruecos', 53, 28),
('Imane', 'Saidi El Habib', 'Marruecos', 29, 28),

-- Excursión 29 (id = 29)
('Seán', 'O Connor Kelly',     'Irlanda',         46, 29),
('Aoife',    'Murphy Doyle',        'Irlanda',         28, 29),
('Conor',    'Walsh O Brien', 'Irlanda', 37, 29),
('Niamh', 'Byrne Gallagher', 'Irlanda', 24, 29),
('Liam', 'Doyle Fitzgerald', 'Irlanda', 49, 29),
('Ciara', 'Hayes McCarthy', 'Irlanda', 32, 29),
('Patrick', 'Ryan Casey', 'Irlanda', 55, 29),
('Orla', 'Daly Quinn', 'Irlanda', 27, 29),
('Shane', 'Murray Brennan', 'Irlanda', 41, 29),
('Maeve', 'Kavanagh Nolan', 'Irlanda', 30, 29),

-- Excursión 30 (id = 30)
('André', 'Dubois Tremblay', 'Canadá', 52, 30),
('Sophie', 'Lavoie Gagnon', 'Canadá', 29, 30),
('Olivier', 'Bouchard Fortin', 'Canadá', 38, 30),
('Émilie', 'Côté Bélanger', 'Canadá', 25, 30),
('Martin', 'Morel Bergeron', 'Canadá', 47, 30),
('Camille', 'Morin Boucher', 'Canadá', 31, 30),
('Alexandre', 'Gauthier Lemieux', 'Canadá', 40, 30),
('Marie', 'Lapointe Roy', 'Canadá', 27, 30),
('Nicolas', 'Poirier Cloutier', 'Canadá', 55, 30),
('Julie', 'Caron Desjardins', 'Canadá', 34, 30);