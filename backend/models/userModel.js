const pool = require('./db');
const bcrypt = require('bcrypt');

const User = {
  async create(userData) {
    const { tipo, cpf_cnpj, nome, sobrenome, email, whatsapp, senha } = userData;
    const hashedPassword = await bcrypt.hash(senha, 10);
    
    const query = `
      INSERT INTO usuarios (
        tipo, cpf_cnpj, nome, sobrenome, email, whatsapp, senha_hash
      ) VALUES ($1, $2, $3, $4, $5, $6, $7)
      RETURNING id, email, nome
    `;

    const values = [tipo, cpf_cnpj, nome, sobrenome, email, whatsapp, hashedPassword];
    const { rows } = await pool.query(query, values);
    return rows[0];
  },

  async findByEmail(email) {
    const query = 'SELECT * FROM usuarios WHERE email = $1';
    const { rows } = await pool.query(query, [email]);
    return rows[0];
  }
};

module.exports = User;