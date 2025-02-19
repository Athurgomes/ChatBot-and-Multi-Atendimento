const { registerSchema, loginSchema } = require('../utils/validations');
const { ValidationError } = require('joi');

const validateRequest = (schema) => {
  return async (req, res, next) => {
    try {
      await schema.validateAsync(req.body, {
        abortEarly: false,
        stripUnknown: true
      });
      next();
    } catch (error) {
      if (error instanceof ValidationError) {
        const errors = error.details.map(detail => ({
          field: detail.context.label,
          message: detail.message.replace(/"/g, '')
        }));
        
        return res.status(400).json({
          code: 'VALIDATION_FAILED',
          errors: errors
        });
      }

      console.error('Erro inesperado:', error);
      res.status(500).json({
        code: 'SERVER_ERROR',
        message: 'Erro interno no servidor'
      });
    }
  };
};

module.exports = {
  validateRegister: validateRequest(registerSchema),
  validateLogin: validateRequest(loginSchema)
};