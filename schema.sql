-- Table Utilisateurs
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    matricule VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('STUDENT', 'TEACHER', 'PARENT', 'ADMIN')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des Notes
CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_matricule VARCHAR(50) REFERENCES users(matricule) ON DELETE CASCADE,
    subject VARCHAR(100) NOT NULL,
    grade NUMERIC(4, 2) NOT NULL,
    coef INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertion d'un utilisateur de test (Mot de passe: password123)
INSERT INTO users (matricule, password_hash, name, role) 
VALUES ('CI-2026-897', '$2a$10$wN10c12Wv9u6Y5c.qY13uO4y123456789012345678901234567890', 'Agoua Ruben', 'STUDENT');

-- Insertion de notes initiales
INSERT INTO grades (student_matricule, subject, grade, coef) VALUES
('CI-2026-897', 'Mathématiques', 16.5, 4),
('CI-2026-897', 'Physique-Chimie', 14.0, 3),
('CI-2026-897', 'Français', 15.0, 2);