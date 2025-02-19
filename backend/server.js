require('dotenv').config();
const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const helmet = require('helmet');
const pool = require('./models/db');

const app = express();

// ======================
// Configurações Básicas
// ======================
const corsOptions = {
  origin: process.env.NODE_ENV === 'production' 
    ? process.env.CORS_ORIGIN_PROD.split(',') 
    : process.env.CORS_ORIGIN_DEV.split(','),
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true
};

// ================
// Middlewares
// ================
app.use(helmet()); // Adiciona headers de segurança
app.use(cors(corsOptions)); // Configuração CORS mais segura
app.use(morgan('dev'));
app.use(express.json({ limit: '10kb' })); // Limita tamanho do payload

// ================
// Rotas
// ================
const authRoutes = require('./routes/authRoutes');
app.use('/api/auth', authRoutes);

// ======================
// Health Check Endpoint
// ======================
app.get('/api/status', async (req, res) => {
  try {
    await pool.query('SELECT 1 + 1 AS result');
    res.status(200).json({
      status: 'online',
      database: 'connected',
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    res.status(500).json({
      status: 'online',
      database: 'disconnected',
      error: error.message
    });
  }
});

// ======================
// Tratamento de Erros
// ======================
app.use((err, req, res, next) => {
  console.error('[ERROR]', new Date().toISOString(), err);
  
  res.status(err.statusCode || 500).json({
    code: err.code || 'SERVER_ERROR',
    message: err.message || 'Erro interno do servidor',
    ...(process.env.NODE_ENV === 'development' && { stack: err.stack })
  });
});

// ======================
// Inicialização do Servidor
// ======================
const PORT = process.env.PORT || 5000;

const startServer = async () => {
  try {
    // Testa conexão com o banco
    await pool.query('SELECT NOW()');
    console.log('✅ Conexão com o banco estabelecida');

    app.listen(PORT, () => {
      console.log(`🚀 Servidor rodando na porta ${PORT}`);
      console.log(`⚙️  Ambiente: ${process.env.NODE_ENV || 'development'}`);
    });
  } catch (error) {
    console.error('❌ Falha na conexão com o banco:');
    console.error(error);
    process.exit(1);
  }
};

startServer();