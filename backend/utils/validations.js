const Joi = require('joi');

// Configuração de mensagens customizadas
const customMessages = {
  'string.empty': 'O campo {#label} é obrigatório',
  'any.required': 'O campo {#label} é obrigatório',
  'string.email': 'Informe um email válido',
  'string.min': 'O campo {#label} deve ter no mínimo {#limit} caracteres'
};

// Schema de registro
const registerSchema = Joi.object({
  tipo: Joi.string().valid('Pessoa Física', 'Pessoa Jurídica').required(),
  cpf_cnpj: Joi.alternatives().conditional('tipo', {
    is: 'Pessoa Física',
    then: Joi.string().pattern(/^\d{3}\.\d{3}\.\d{3}-\d{2}$/).required(),
    otherwise: Joi.string().pattern(/^\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$/).required()
  }),
  nome: Joi.string().required(),
  sobrenome: Joi.string().required(),
  email: Joi.string().email().required(),
  whatsapp: Joi.string().required(),
  senha: Joi.string().min(6).required(),
  confirmarSenha: Joi.string().valid(Joi.ref('senha')).required()
}).messages(customMessages);

// Schema de login
const loginSchema = Joi.object({
  email: Joi.string().email().required(),
  senha: Joi.string().required()
}).messages(customMessages);

module.exports = {
  registerSchema,
  loginSchema
};