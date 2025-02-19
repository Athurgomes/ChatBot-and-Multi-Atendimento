// Remova as validações Joi do controller (agora tratadas pelo middleware)
exports.register = async (req, res) => {
    try {
      // A validação já foi feita pelo middleware
      const existingUser = await User.findByEmail(req.body.email);
      if (existingUser) return res.status(400).json({ error: 'Email já cadastrado' });
  
      // ... restante do código mantém igual
    } catch (error) {
      res.status(500).json({ error: 'Erro no servidor' });
    }
  };
  
  exports.login = async (req, res) => {
    try {
      // A validação já foi feita pelo middleware
      // ... restante do código mantém igual
    } catch (error) {
      res.status(500).json({ error: 'Erro no servidor' });
    }
  };